import { exec, execSync, execFile } from "child_process";
import * as cp from "child_process";
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { z } from "zod";
import axios from "axios";

const server = new McpServer({ name: "test-server", version: "1.0.0" });
const urlSchema = z.string().url();

// --- setRequestHandler nested args (command injection TP) ---

server.setRequestHandler("tools/call", async (REQ) => {
  const cmd = REQ.params.arguments.command;
  // ruleid: mcp-command-injection-typescript
  exec(cmd);
  return {};
});

// --- server.tool TP ---

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

// --- command injection TN (zod.parse sanitizer) ---

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

// --- SSRF TP ---

server.setRequestHandler("resources/read", async (REQ) => {
  const url = REQ.params.arguments.url;
  // ruleid: mcp-ssrf-typescript
  await fetch(url);
  return {};
});

server.tool("fetch-url", { url: z.string() }, async ({ url }) => {
  // ruleid: mcp-ssrf-typescript
  await axios.get(url);
  return { content: [{ type: "text" as const, text: "done" }] };
});

server.registerTool(
  "proxy-v2",
  { description: "proxy", inputSchema: z.object({ url: z.string() }) },
  async ({ url }) => {
    // ruleid: mcp-ssrf-typescript
    await fetch(url);
    return { content: [{ type: "text" as const, text: "done" }] };
  }
);

// --- SSRF TN (zod.parse / schema.parse) ---

server.tool("safe-fetch", { url: z.string() }, async ({ url }) => {
  const safeUrl = urlSchema.parse(url);
  // ok: mcp-ssrf-typescript
  await fetch(safeUrl);
  return { content: [{ type: "text" as const, text: "done" }] };
});

server.tool("hardcoded-fetch", {}, async () => {
  // ok: mcp-ssrf-typescript
  await fetch("https://example.com/api");
  return { content: [{ type: "text" as const, text: "done" }] };
});

function unrelated(cmd: string) {
  // ok: mcp-command-injection-typescript
  exec(cmd);
}
