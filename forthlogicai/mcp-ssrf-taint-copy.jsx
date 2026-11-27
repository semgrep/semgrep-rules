import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";
import http from "http";
import https from "https";
import axios from "axios";
import got from "got";
import fetch from "node-fetch";

const server = new Server(
  {
    name: "example-server",
    version: "1.0.0",
  },
  {
    capabilities: {
      tools: {},
    },
  },
);

// Vulnerable MCP tool implementations - SSRF via arbitrary URLs

server.setRequestHandler("tools/call", async (request) => {
  const { name, arguments: args } = request.params;

  switch (name) {
    case "fetch_url":
      // deepruleid: mcp-ssrf-taint
      const response1 = await fetch(args.url);
      return { content: [{ type: "text", text: await response1.text() }] };

    case "fetch_with_axios":
      const response2 = await axios.get(args.url);
      return { content: [{ type: "text", text: response2.data }] };

    case "fetch_with_https":
      return new Promise((resolve) => {
        https.get(args.url, (res) => {
          let data = "";
          res.on("data", (chunk) => (data += chunk));
          res.on("end", () =>
            resolve({ content: [{ type: "text", text: data }] }),
          );
        });
      });

    case "fetch_with_http":
      return new Promise((resolve) => {
        http.get(args.url, (res) => {
          let data = "";
          res.on("data", (chunk) => (data += chunk));
          res.on("end", () =>
            resolve({ content: [{ type: "text", text: data }] }),
          );
        });
      });

    case "fetch_with_got":
      const response3 = await got(args.url);
      return { content: [{ type: "text", text: response3.body }] };

    case "post_data":
      const response4 = await axios.post(args.url, { data: args.data });
      return { content: [{ type: "text", text: response4.data }] };

    case "fetch_internal":
      // deepruleid: mcp-ssrf-taint
      const response5 = await fetch(`http://internal-service/${args.endpoint}`);
      return { content: [{ type: "text", text: await response5.text() }] };

    case "fetch_metadata":
      const response6 = await axios.get(
        `http://169.254.169.254/latest/meta-data/${args.path}`,
      );
      return { content: [{ type: "text", text: response6.data }] };

    case "fetch_localhost":
      const response7 = await fetch(
        // deepruleid: mcp-ssrf-taint
        `http://localhost:${args.port}/${args.path}`,
      );
      return { content: [{ type: "text", text: await response7.text() }] };

    case "scan_port":
      try {
        const response8 = await axios.get(`http://${args.host}:${args.port}`, {
          timeout: 1000,
        });
        return { content: [{ type: "text", text: "open" }] };
      } catch (error) {
        return { content: [{ type: "text", text: "closed" }] };
      }

    case "fetch_with_axios_instance":
      const instance = axios.create();

      const response9 = await instance.get(args.url);
      return { content: [{ type: "text", text: response9.data }] };

    case "fetch_with_request_options":
      const response10 = await axios.request({ url: args.url, method: "GET" });
      return { content: [{ type: "text", text: response10.data }] };

    // Safe MCP tool implementations

    case "fetch_from_api":
      const allowedDomain = "https://api.example.com";
      // deepruleid: mcp-ssrf-taint
      const response11 = await fetch(`${allowedDomain}/${args.path}`);
      return { content: [{ type: "text", text: await response11.text() }] };

    case "fetch_validated_url":
      const allowedDomains = [
        "https://api.example.com",
        "https://trusted.example.com",
      ];
      if (!allowedDomains.includes(args.url)) {
        throw new Error("URL not in allowlist");
      }
      // deepruleid: mcp-ssrf-taint
      const response12 = await fetch(args.url);
      return { content: [{ type: "text", text: await response12.text() }] };

    case "fetch_with_prefix_check":
      if (!args.url.startsWith("https://api.example.com/")) {
        throw new Error("Invalid URL prefix");
      }
      // deepruleid: mcp-ssrf-taint
      const response13 = await fetch(args.url);
      return { content: [{ type: "text", text: await response13.text() }] };

    case "fetch_with_url_parse":
      const parsed = new URL(args.url);
      if (
        !["api.example.com", "trusted.example.com"].includes(parsed.hostname)
      ) {
        throw new Error("Invalid hostname");
      }
      // deepruleid: mcp-ssrf-taint
      const response14 = await fetch(args.url);
      return { content: [{ type: "text", text: await response14.text() }] };

    case "fetch_hardcoded":
      // ok: mcp-ssrf-taint
      const response15 = await fetch("https://api.example.com/data");
      return { content: [{ type: "text", text: await response15.text() }] };

    case "fetch_github_api":
      // Safe: template literal with hardcoded base URL
      const apiUrl = `https://api.github.com/repos/${args.owner}/${args.repo}`;
      // deepruleid: mcp-ssrf-taint
      const response16 = await fetch(apiUrl);
      return { content: [{ type: "text", text: await response16.text() }] };

    case "fetch_dockerhub":
      // Safe: template literal with hardcoded base URL
      const response17 = await fetch(
        // deepruleid: mcp-ssrf-taint
        `https://hub.docker.com/v2/repositories/${args.imagePath}`,
      );
      return { content: [{ type: "text", text: await response17.text() }] };

    case "fetch_with_hardcoded_base":
      // Safe: template literal with hardcoded base URL variable
      const baseUrl = "https://api.example.com";
      // ok: mcp-ssrf-taint
      const response18 = await axios.get(`${baseUrl}/users/${args.userId}`);
      return { content: [{ type: "text", text: response18.data }] };

    case "fetch_npm_registry":
      // Safe: template literal with hardcoded base URL
      const response19 = await fetch(
        // deepruleid: mcp-ssrf-taint
        `https://registry.npmjs.org/${args.packageName}`,
      );
      return { content: [{ type: "text", text: await response19.text() }] };

    default:
      throw new Error("Unknown tool");
  }
});

// Test cases for imported values (should be treated as static)
import apiConfig from "./config.js";
import { API_BASE_URL, GITHUB_API } from "./constants.js";
import * as config from "./settings.js";
const endpoints = require("./endpoints.js");
const { baseUrl, apiEndpoint } = require("./config.js");

server.setRequestHandler("tools/call", async (request) => {
  const { name, arguments: args } = request.params;

  switch (name) {
    case "fetch_with_imported_base":
      // Safe: imported value is static, not tainted
      // deepruleid: mcp-ssrf-taint
      const response20 = await fetch(`${API_BASE_URL}/users/${args.userId}`);
      return { content: [{ type: "text", text: await response20.text() }] };

    case "fetch_with_default_import":
      // Safe: default import is static
      // ok: mcp-ssrf-taint
      const response21 = await axios.get(
        `${apiConfig.baseUrl}/data/${args.id}`,
      );
      return { content: [{ type: "text", text: response21.data }] };

    case "fetch_with_namespace_import":
      // Safe: namespace import is static
      // deepruleid: mcp-ssrf-taint
      const response22 = await fetch(`${config.apiUrl}/items/${args.itemId}`);
      return { content: [{ type: "text", text: await response22.text() }] };

    case "fetch_with_required_module":
      // Safe: required module is static
      // ok: mcp-ssrf-taint
      const response23 = await axios.get(
        `${endpoints.api}/products/${args.productId}`,
      );
      return { content: [{ type: "text", text: response23.data }] };

    case "fetch_with_destructured_require":
      // Safe: destructured require is static
      // deepruleid: mcp-ssrf-taint
      const response24 = await fetch(`${baseUrl}/orders/${args.orderId}`);
      return { content: [{ type: "text", text: await response24.text() }] };

    case "fetch_with_multiple_imports":
      // Safe: both imported values are static
      // ok: mcp-ssrf-taint
      const response25 = await axios.get(
        `${GITHUB_API}/repos/${args.owner}/${args.repo}`,
      );
      return { content: [{ type: "text", text: response25.data }] };

    case "fetch_with_imported_property":
      // Safe: property access on imported object is static
      // deepruleid: mcp-ssrf-taint
      const response26 = await fetch(`${apiEndpoint}/search/${args.query}`);
      return { content: [{ type: "text", text: await response26.text() }] };

    default:
      throw new Error("Unknown tool");
  }
});

// Server setup
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
}

main().catch(console.error);
