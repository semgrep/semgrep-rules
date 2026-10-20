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
  // ruleid: mcp-shell-exec-template-interpolation
  return execAsync(`zip -r archive.zip ${dir}`);
}

server.tool("archive", { dir: z.string() }, async ({ dir }) => {
  await archiveDirectory(dir);
  return { content: [{ type: "text", text: "ok" }] };
});

server.tool("convert", { file: z.string() }, async ({ file }) => {
  // ruleid: mcp-shell-exec-template-interpolation
  const { stdout } = await execAsync(`pandoc ${file} -o out.pdf`);
  return { content: [{ type: "text", text: stdout }] };
});

export function gitLog(branch: string) {
  // ruleid: mcp-shell-exec-template-interpolation
  exec(`git log --oneline ${branch}`, (err, out) => out);
}

export function thumbnail(input: string) {
  // ruleid: mcp-shell-exec-template-interpolation
  return execSync(`convert "${input}" -resize 64x64 thumb.png`).toString();
}

export function pingHost(host: string) {
  // ruleid: mcp-shell-exec-template-interpolation
  return cp.execSync(`ping -c 1 ${host}`).toString();
}

// Plugin frameworks hand tools a context object whose exec runs through a shell.
interface ToolContext {
  exec(command: string): Promise<string>;
}

export async function packLogs(ctx: ToolContext, dir: string) {
  // ruleid: mcp-shell-exec-template-interpolation
  return ctx.exec(`tar -czf logs.tgz ${dir}`);
}

export async function packLogsSafely(ctx: ToolContext & { execFile(bin: string, args: string[]): Promise<string> }, dir: string) {
  // ok: mcp-shell-exec-template-interpolation
  return ctx.execFile("tar", ["-czf", "logs.tgz", "--", dir]);
}

export function gitLogSafely(branch: string) {
  // ok: mcp-shell-exec-template-interpolation
  execFile("git", ["log", "--oneline", branch]);
  // ok: mcp-shell-exec-template-interpolation
  spawn("git", ["log", "--oneline", branch]);
}

export function staticCommands() {
  // ok: mcp-shell-exec-template-interpolation
  exec("git status");
  // ok: mcp-shell-exec-template-interpolation
  execSync(`git rev-parse HEAD`);
}

// `exec` is also RegExp.prototype.exec, which takes the subject string.
const VERSION_RE = /version (\d+)/;
const countRe = /(\d+) items/;

export function parseOutput(stdout: string, stderr: string) {
  // ok: mcp-shell-exec-template-interpolation
  const a = /(\d+) files/.exec(`${stdout}\n${stderr}`);
  // ok: mcp-shell-exec-template-interpolation
  const b = VERSION_RE.exec(`${stdout}`);
  // ok: mcp-shell-exec-template-interpolation
  const c = countRe.exec(`${stderr}`);
  // ok: mcp-shell-exec-template-interpolation
  const d = new RegExp("total (\\d+)").exec(`${stdout}`);
  return [a, b, c, d];
}

// `exec` is also Database#exec in SQLite bindings, which runs SQL without a shell.
interface Database {
  exec(sql: string): void;
}

export function migrate(db: Database, table: string) {
  // ok: mcp-shell-exec-template-interpolation
  db.exec(`CREATE TABLE IF NOT EXISTS ${table} (id INTEGER PRIMARY KEY)`);
  // ok: mcp-shell-exec-template-interpolation
  db.exec(`ALTER TABLE ${table} ADD COLUMN note TEXT`);
}

// A promisify(exec) alias is followed by its binding, whatever it is named.
const runCommand = promisify(exec);
const runCommandCp = promisify(cp.exec);

export async function listArchive(file: string) {
  // ruleid: mcp-shell-exec-template-interpolation
  await runCommand(`unzip -l ${file}`);
  // ruleid: mcp-shell-exec-template-interpolation
  await runCommandCp(`unzip -l ${file}`);
}

// Receivers are skipped only when their name ends like a regex, not when it merely contains one.
const patternRunner = { exec };

export function search(term: string) {
  // ruleid: mcp-shell-exec-template-interpolation
  patternRunner.exec(`grep ${term} input.txt`);
}

// Bash `select` is shell syntax, not SQL.
export function choose(items: string) {
  // ruleid: mcp-shell-exec-template-interpolation
  cp.execSync(`select item in ${items}; do echo "$item"; break; done`, { shell: "/bin/bash" });
}

export function migrateMore(db: Database, table: string, n: number) {
  // ok: mcp-shell-exec-template-interpolation
  db.exec(`-- add notes to ${table}\nALTER TABLE ${table} ADD COLUMN note TEXT`);
  // ok: mcp-shell-exec-template-interpolation
  db.exec(`/* bulk */ DELETE FROM ${table}`);
  // ok: mcp-shell-exec-template-interpolation
  db.exec(`
    CREATE INDEX IF NOT EXISTS ${table}_note_idx ON ${table} (note)
  `);
  // ok: mcp-shell-exec-template-interpolation
  db.exec(`WITH recent AS (SELECT * FROM ${table} LIMIT ${n}) SELECT count(*) FROM recent`);
}

// A name that contains "regex" is a regex wherever the word sits; Pattern/Matcher/Re only as a suffix.
export function parseWith(regexParser: RegExp, input: string) {
  // ok: mcp-shell-exec-template-interpolation
  return regexParser.exec(`${input}`);
}

// String.raw keeps backslashes (Windows paths) but does not escape the interpolated value.
export function searchLogs(ctx: ToolContext, file: string) {
  // ruleid: mcp-shell-exec-template-interpolation
  exec(String.raw`findstr /s ${file} C:\Logs\*.log`);
  // ruleid: mcp-shell-exec-template-interpolation
  return ctx.exec(String.raw`findstr /s ${file} C:\Logs\*.log`);
}

// Known limitation: regex libraries bound to names that do not look like regexes.
const RE2 = require("re2");
const token = new RE2("\\w+");

export function tokenize(input: string) {
  // todook: mcp-shell-exec-template-interpolation
  return token.exec(`${input}`);
}

// Known limitation: a command assembled into a variable before the call is not matched.
// The handler-scoped taint rule (mcp-command-injection-typescript) covers this shape
// when the value comes straight from the tool arguments.
export function diskUsage(dir: string) {
  const command = `du -sh ${dir}`;
  // todoruleid: mcp-shell-exec-template-interpolation
  return execSync(command).toString();
}
