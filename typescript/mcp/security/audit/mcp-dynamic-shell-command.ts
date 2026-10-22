import { exec, execSync, execFile, spawn } from "child_process";
import * as cp from "child_process";
import { promisify } from "util";
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { z } from "zod";

const execAsync = promisify(exec);
const server = new McpServer({ name: "example", version: "1.0.0" });

// The handler passes its argument to a helper; the shell call sits in the helper,
// so a taint rule that only follows values inside the handler does not reach it.
async function archiveDirectory(dir: string) {
  // ruleid: mcp-dynamic-shell-command
  return execAsync(`zip -r archive.zip ${dir}`);
}

server.tool("archive", { dir: z.string() }, async ({ dir }) => {
  await archiveDirectory(dir);
  return { content: [{ type: "text", text: "ok" }] };
});

server.tool("convert", { file: z.string() }, async ({ file }) => {
  // ruleid: mcp-dynamic-shell-command
  const { stdout } = await execAsync(`pandoc ${file} -o out.pdf`);
  return { content: [{ type: "text", text: stdout }] };
});

export function gitLog(branch: string) {
  // ruleid: mcp-dynamic-shell-command
  exec(`git log --oneline ${branch}`, (err, out) => out);
}

export function thumbnail(input: string) {
  // ruleid: mcp-dynamic-shell-command
  return execSync(`convert "${input}" -resize 64x64 thumb.png`).toString();
}

export function pingHost(host: string) {
  // ruleid: mcp-dynamic-shell-command
  return cp.execSync(`ping -c 1 ${host}`).toString();
}

// Plugin frameworks hand tools a context object whose exec runs through a shell.
interface ToolContext {
  exec(command: string): Promise<string>;
}

export async function packLogs(ctx: ToolContext, dir: string) {
  // ruleid: mcp-dynamic-shell-command
  return ctx.exec(`tar -czf logs.tgz ${dir}`);
}

export async function packLogsSafely(ctx: ToolContext & { execFile(bin: string, args: string[]): Promise<string> }, dir: string) {
  // ok: mcp-dynamic-shell-command
  return ctx.execFile("tar", ["-czf", "logs.tgz", "--", dir]);
}

export function gitLogSafely(branch: string) {
  // ok: mcp-dynamic-shell-command
  execFile("git", ["log", "--oneline", branch]);
  // ok: mcp-dynamic-shell-command
  spawn("git", ["log", "--oneline", branch]);
}

export function staticCommands() {
  // ok: mcp-dynamic-shell-command
  exec("git status");
  // ok: mcp-dynamic-shell-command
  execSync(`git rev-parse HEAD`);
}

// `exec` is also RegExp.prototype.exec, which takes the subject string.
const VERSION_RE = /version (\d+)/;
const countRe = /(\d+) items/;

export function parseOutput(stdout: string, stderr: string) {
  // ok: mcp-dynamic-shell-command
  const a = /(\d+) files/.exec(`${stdout}\n${stderr}`);
  // ok: mcp-dynamic-shell-command
  const b = VERSION_RE.exec(`${stdout}`);
  // ok: mcp-dynamic-shell-command
  const c = countRe.exec(`${stderr}`);
  // ok: mcp-dynamic-shell-command
  const d = new RegExp("total (\\d+)").exec(`${stdout}`);
  return [a, b, c, d];
}

// `exec` is also Database#exec in SQLite bindings, which runs SQL without a shell.
interface Database {
  exec(sql: string): void;
}

export function migrate(db: Database, table: string) {
  // ok: mcp-dynamic-shell-command
  db.exec(`CREATE TABLE IF NOT EXISTS ${table} (id INTEGER PRIMARY KEY)`);
  // ok: mcp-dynamic-shell-command
  db.exec(`ALTER TABLE ${table} ADD COLUMN note TEXT`);
}

// A promisify(exec) alias is followed by its binding, whatever it is named.
const runCommand = promisify(exec);
const runCommandCp = promisify(cp.exec);

export async function listArchive(file: string) {
  // ruleid: mcp-dynamic-shell-command
  await runCommand(`unzip -l ${file}`);
  // ruleid: mcp-dynamic-shell-command
  await runCommandCp(`unzip -l ${file}`);
}

// Receivers are skipped only when their name ends like a regex, not when it merely contains one.
const patternRunner = { exec };

export function search(term: string) {
  // ruleid: mcp-dynamic-shell-command
  patternRunner.exec(`grep ${term} input.txt`);
}

// Bash `select` is shell syntax, not SQL.
export function choose(items: string) {
  // ruleid: mcp-dynamic-shell-command
  cp.execSync(`select item in ${items}; do echo "$item"; break; done`, { shell: "/bin/bash" });
}

export function migrateMore(db: Database, table: string, n: number) {
  // ok: mcp-dynamic-shell-command
  db.exec(`-- add notes to ${table}\nALTER TABLE ${table} ADD COLUMN note TEXT`);
  // ok: mcp-dynamic-shell-command
  db.exec(`/* bulk */ DELETE FROM ${table}`);
  // ok: mcp-dynamic-shell-command
  db.exec(`
    CREATE INDEX IF NOT EXISTS ${table}_note_idx ON ${table} (note)
  `);
  // ok: mcp-dynamic-shell-command
  db.exec(`WITH recent AS (SELECT * FROM ${table} LIMIT ${n}) SELECT count(*) FROM recent`);
}

// A name that contains "regex" is a regex wherever the word sits; Pattern/Matcher/Re only as a suffix.
export function parseWith(regexParser: RegExp, input: string) {
  // ok: mcp-dynamic-shell-command
  return regexParser.exec(`${input}`);
}

// String.raw keeps backslashes (Windows paths) but does not escape the interpolated value.
export function searchLogs(ctx: ToolContext, file: string) {
  // ruleid: mcp-dynamic-shell-command
  exec(String.raw`findstr /s ${file} C:\Logs\*.log`);
  // ruleid: mcp-dynamic-shell-command
  return ctx.exec(String.raw`findstr /s ${file} C:\Logs\*.log`);
}

// Known limitation: regex libraries bound to names that do not look like regexes.
const RE2 = require("re2");
const token = new RE2("\\w+");

export function tokenize(input: string) {
  // todook: mcp-dynamic-shell-command
  return token.exec(`${input}`);
}

// A command assembled into a variable before the call, by interpolation or concatenation.
export function diskUsage(dir: string) {
  const command = `du -sh ${dir}`;
  // ruleid: mcp-dynamic-shell-command
  return execSync(command).toString();
}

export async function branchLog(branch: string) {
  let command = "git log --oneline " + branch;
  if (branch.length > 40) {
    // ruleid: mcp-dynamic-shell-command
    await execAsync(command);
  }
  const listing = String.raw`dir ${branch}\*`;
  // ruleid: mcp-dynamic-shell-command
  cp.exec(listing);
}

export function assembledButFixed() {
  const command = "git status --short";
  // ok: mcp-dynamic-shell-command
  return execSync(command).toString();
}

// Concatenation passed straight to a shell-backed exec.
export async function concatenated(branch: string, host: string, base: string) {
  // ruleid: mcp-dynamic-shell-command
  exec("git log --oneline " + branch);
  // ruleid: mcp-dynamic-shell-command
  cp.execSync("ping -c 1 " + host);
  // ruleid: mcp-dynamic-shell-command
  await runCommand(base + " --json");
  // ok: mcp-dynamic-shell-command
  exec("git " + "status");
}

// Concatenation and assembled variables are not followed into generic .exec members:
// RegExp#exec and Database#exec take built strings far more often than shells do.
export function genericMembers(db: Database, matcher: RegExp, table: string, input: string) {
  const sql = `CREATE TABLE IF NOT EXISTS ${table} (id INTEGER)`;
  // ok: mcp-dynamic-shell-command
  db.exec(sql);
  // ok: mcp-dynamic-shell-command
  db.exec("DELETE FROM " + table);
  const subject = "prefix:" + input;
  // ok: mcp-dynamic-shell-command
  return matcher.exec(subject);
}

// spawn/execFile run through a shell when the shell option is set; the command and
// the arguments are joined into one string that the shell parses.
export function shellOption(dir: string, file: string) {
  // ruleid: mcp-dynamic-shell-command
  spawn(`ls ${dir}`, { shell: true });
  // ruleid: mcp-dynamic-shell-command
  spawn("git", ["log", "--oneline", dir], { shell: true });
  // ruleid: mcp-dynamic-shell-command
  cp.spawnSync("tar", ["-xf", file], { stdio: "inherit", shell: process.platform === "win32" });
  // ruleid: mcp-dynamic-shell-command
  execFile("du", ["-sh", dir], { shell: true }, () => undefined);
  // ok: mcp-dynamic-shell-command
  spawn("git", ["status", "--short"], { shell: true });
  // ok: mcp-dynamic-shell-command
  spawn("git", ["log", "--oneline", dir], { shell: false });
  // A choice between two literal commands is still fixed in the source.
  // ok: mcp-dynamic-shell-command
  spawn(process.platform === "win32" ? "pnpm.cmd" : "pnpm", ["install"], { shell: process.platform === "win32" });
}

// An explicit shell with -c takes its script as one string.
export function explicitShell(dir: string, script: string) {
  // ruleid: mcp-dynamic-shell-command
  spawn("sh", ["-c", `du -sh ${dir}`]);
  // ruleid: mcp-dynamic-shell-command
  cp.execFileSync("/bin/bash", ["-lc", script]);
  // ruleid: mcp-dynamic-shell-command
  spawn("cmd.exe", ["/c", "dir " + dir]);
  // ok: mcp-dynamic-shell-command
  spawn("sh", ["-c", "echo ready"]);
  // ok: mcp-dynamic-shell-command
  spawn("sh", ["./install.sh", dir]);
}

// A fixed concatenation elsewhere in the function does not hide a dynamic one.
export function laterConcatenation(x: string) {
  const label = "git " + "status";
  // ruleid: mcp-dynamic-shell-command
  execSync("echo " + x);
  return label;
}

// A fixed command assembled into a variable is fixed for the module-object call too.
const childProcess = require("node:child_process");

export function fixedAssembledModuleCall() {
  const command = "git " + "status";
  // ok: mcp-dynamic-shell-command
  childProcess.execSync(command);
}

// PowerShell parameters are case-insensitive; shell flags can be bundled.
export function shellFlags(script: string) {
  // ruleid: mcp-dynamic-shell-command
  spawn("powershell", ["-command", script]);
  // ruleid: mcp-dynamic-shell-command
  spawn("pwsh.exe", ["-NoProfile", "-c", script]);
  // ruleid: mcp-dynamic-shell-command
  spawn("bash", ["-ce", script]);
  // ruleid: mcp-dynamic-shell-command
  spawn("pwsh", ["-C", script]);
}

// Fixed literals may contain escapes, and a fixed choice may test an optional property.
export function fixedWithEscapes(cfg: { windows?: boolean } | undefined) {
  // ok: mcp-dynamic-shell-command
  spawn("printf", ["ready\\n", `cost: $5`], { shell: true });
  // ok: mcp-dynamic-shell-command
  spawn(cfg?.windows ?? false ? "pnpm.cmd" : "pnpm", ["install"], { shell: true });
}

// Known limitation: a spread after shell: false can turn the shell back on.
export function spreadAfterShellFalse(ref: string, options: { shell?: boolean }) {
  // todoruleid: mcp-dynamic-shell-command
  spawn("git", ["show", ref], { shell: false, ...options });
}

// Known limitation: reassignment to a fixed string after assembly is not tracked.
export function reassignedToFixed(x: string) {
  let command = "echo " + x;
  command = "git status";
  // todook: mcp-dynamic-shell-command
  execSync(command);
}
