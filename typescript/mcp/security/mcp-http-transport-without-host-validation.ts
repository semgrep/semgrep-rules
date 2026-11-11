import express from "express";
import { randomUUID } from "node:crypto";
import { createMcpExpressApp } from "@modelcontextprotocol/sdk/server/express.js";
import {
  hostHeaderValidation,
  localhostHostValidation,
} from "@modelcontextprotocol/sdk/server/middleware/hostHeaderValidation.js";
import { StreamableHTTPServerTransport } from "@modelcontextprotocol/sdk/server/streamableHttp.js";
import { SSEServerTransport } from "@modelcontextprotocol/sdk/server/sse.js";

function plainApp() {
  const app = express();
  app.use(express.json());
  app.post("/mcp", async (req, res) => {
    // ruleid: mcp-http-transport-without-host-validation
    const transport = new StreamableHTTPServerTransport({
      sessionIdGenerator: () => randomUUID(),
    });
    await transport.handleRequest(req, res, req.body);
  });
  app.listen(3000, "127.0.0.1");
}

function plainAppSse() {
  const app = express();
  app.get("/sse", (req, res) => {
    // ruleid: mcp-http-transport-without-host-validation
    const transport = new SSEServerTransport("/messages", res);
  });
  app.listen(3001);
}

function optionSetToFalse() {
  const app = express();
  app.post("/mcp", async (req, res) => {
    // ruleid: mcp-http-transport-without-host-validation
    const transport = new StreamableHTTPServerTransport({
      sessionIdGenerator: undefined,
      enableDnsRebindingProtection: false,
    });
  });
}

function sdkApp() {
  // createMcpExpressApp() adds localhostHostValidation() for loopback binds.
  const app = createMcpExpressApp();
  app.post("/mcp", async (req, res) => {
    // ok: mcp-http-transport-without-host-validation
    const transport = new StreamableHTTPServerTransport({
      sessionIdGenerator: () => randomUUID(),
    });
  });
}

function withHostValidation() {
  const app = express();
  app.use(hostHeaderValidation(["localhost", "127.0.0.1"]));
  app.post("/mcp", async (req, res) => {
    // ok: mcp-http-transport-without-host-validation
    const transport = new StreamableHTTPServerTransport({
      sessionIdGenerator: () => randomUUID(),
    });
  });
}

function withLocalhostValidation() {
  const app = express();
  app.use(localhostHostValidation());
  app.get("/sse", (req, res) => {
    // ok: mcp-http-transport-without-host-validation
    const transport = new SSEServerTransport("/messages", res);
  });
}

function transportOption() {
  const app = express();
  app.post("/mcp", async (req, res) => {
    // ok: mcp-http-transport-without-host-validation
    const transport = new StreamableHTTPServerTransport({
      sessionIdGenerator: () => randomUUID(),
      enableDnsRebindingProtection: true,
      allowedHosts: ["127.0.0.1:3000", "localhost:3000"],
    });
  });
  app.get("/sse", (req, res) => {
    // ok: mcp-http-transport-without-host-validation
    const transport = new SSEServerTransport("/messages", res, {
      enableDnsRebindingProtection: true,
      allowedHosts: ["localhost:3000"],
    });
  });
}
