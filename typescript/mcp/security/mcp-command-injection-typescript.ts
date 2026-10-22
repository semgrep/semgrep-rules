import { exec, execSync, execFile } from "child_process";
import * as cp from "child_process";
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { z } from "zod";
import { promisify } from "util";
import * as util from "util";
import { exec as runShell } from "child_process";
import { FastMCP } from "fastmcp";

const server = new McpServer({ name: "test-server", version: "1.0.0" });
const execAsync = promisify(exec);
const execPromise = util.promisify(cp.exec);
const execFileAsync = promisify(execFile);

server.setRequestHandler("tools/call", async (REQ) => {
  const cmd = REQ.params.arguments.command;
  // ruleid: mcp-command-injection-typescript
  exec(cmd);
  return {};
});

server.tool("run-command", { command: z.string() }, async (args) => {
  // ruleid: mcp-command-injection-typescript
  exec(args.command, () => {});
  return { content: [{ type: "text" as const, text: "done" }] };
});

server.tool("run-sync", { command: z.string() }, async ({ command }) => {
  // ruleid: mcp-command-injection-typescript
  execSync(command);
  return { content: [{ type: "text" as const, text: "ok" }] };
});

server.registerTool(
  "run-v2",
  { description: "run", inputSchema: z.object({ command: z.string() }) },
  async ({ command }) => {
    // ruleid: mcp-command-injection-typescript
    cp.execSync(command);
    return { content: [{ type: "text" as const, text: "done" }] };
  }
);

server.tool("eval-concat", { command: z.string() }, async ({ command }) => {
  // ruleid: mcp-command-injection-typescript
  eval("prefix" + command + "suffix");
  return { content: [{ type: "text" as const, text: "done" }] };
});

server.tool("safe-zod", { command: z.string() }, async ({ command }) => {
  const safe = z.string().parse(command);
  // ok: mcp-command-injection-typescript
  exec(safe);
  return { content: [{ type: "text" as const, text: "done" }] };
});

server.tool("list-files", {}, async () => {
  // ok: mcp-command-injection-typescript
  exec("ls -la /tmp");
  return { content: [{ type: "text" as const, text: "done" }] };
});

server.tool("safe-execfile", { filename: z.string() }, async ({ filename }) => {
  // ok: mcp-command-injection-typescript
  execFile("cat", [filename]);
  return { content: [{ type: "text" as const, text: "done" }] };
});

function unrelated(cmd: string) {
  // ok: mcp-command-injection-typescript
  exec(cmd);
}

server.tool("multi-field", { dir: z.string(), pattern: z.string() }, async ({ dir, pattern }) => {
  // ruleid: mcp-command-injection-typescript
  execSync(`grep -r ${pattern} ${dir}`);
  return { content: [{ type: "text" as const, text: "done" }] };
});

server.tool("promisified-exec", { command: z.string() }, async ({ command }) => {
  // ruleid: mcp-command-injection-typescript
  const { stdout } = await execAsync(command);
  return { content: [{ type: "text" as const, text: stdout }] };
});

server.tool("util-promisified-exec", { ref: z.string() }, async (args) => {
  // ruleid: mcp-command-injection-typescript
  await execPromise(`git log ${args.ref}`);
  return { content: [{ type: "text" as const, text: "done" }] };
});

server.tool("aliased-import", { command: z.string() }, async ({ command }) => {
  // ruleid: mcp-command-injection-typescript
  runShell(command);
  return { content: [{ type: "text" as const, text: "done" }] };
});

server.tool("promisified-execfile", { ref: z.string() }, async ({ ref }) => {
  // ok: mcp-command-injection-typescript
  await execFileAsync("git", ["log", ref]);
  return { content: [{ type: "text" as const, text: "done" }] };
});

const fastmcp = new FastMCP({ name: "test-fastmcp", version: "1.0.0" });

fastmcp.addTool({
  name: "fastmcp-run",
  parameters: z.object({ command: z.string() }),
  execute: async (args) => {
    // ruleid: mcp-command-injection-typescript
    execSync(args.command);
    return "done";
  },
});

fastmcp.addTool({
  name: "fastmcp-run-destructured",
  parameters: z.object({ command: z.string() }),
  execute: async ({ command }) => {
    // ruleid: mcp-command-injection-typescript
    exec(command);
    return "done";
  },
});

fastmcp.addTool({
  name: "fastmcp-static",
  parameters: z.object({}),
  execute: async () => {
    // ok: mcp-command-injection-typescript
    exec("uptime");
    return "done";
  },
});
