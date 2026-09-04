import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { z } from "zod";
import axios from "axios";

const server = new McpServer({ name: "test-server", version: "1.0.0" });
const urlSchema = z.string().url();

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
