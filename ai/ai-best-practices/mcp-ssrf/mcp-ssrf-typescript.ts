import axios from 'axios';
import * as https from 'https';
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { z } from 'zod';

const server = new McpServer({ name: 'test-server', version: '1.0.0' });

// --- TRUE POSITIVES ---

server.tool('fetch-url', { url: z.string() }, async ({ url }) => {
    // ruleid: mcp-ssrf-typescript
    const response = await fetch(url);
    return { content: [{ type: 'text' as const, text: await response.text() }] };
});

server.tool('get-data', { endpoint: z.string() }, async ({ endpoint }) => {
    // ruleid: mcp-ssrf-typescript
    const response = await axios.get(endpoint);
    return { content: [{ type: 'text' as const, text: JSON.stringify(response.data) }] };
});

server.tool('post-data', { url: z.string(), body: z.string() }, async ({ url, body }) => {
    // ruleid: mcp-ssrf-typescript
    const response = await axios.post(url, { data: body });
    return { content: [{ type: 'text' as const, text: JSON.stringify(response.data) }] };
});

server.tool('https-get', { url: z.string() }, async ({ url }) => {
    // ruleid: mcp-ssrf-typescript
    https.get(url, (res) => { /* ... */ });
    return { content: [{ type: 'text' as const, text: 'requested' }] };
});

// v2 registerTool API
server.registerTool(
    'fetch-v2',
    { description: 'Fetch a URL', inputSchema: z.object({ url: z.string() }) },
    async ({ url }) => {
        // ruleid: mcp-ssrf-typescript
        const response = await fetch(url);
        return { content: [{ type: 'text' as const, text: await response.text() }] };
    }
);

// --- TRUE NEGATIVES ---

server.tool('fetch-fixed', {}, async () => {
    // ok: mcp-ssrf-typescript
    // Hardcoded URL — not user-controlled, not SSRF
    const response = await fetch('https://api.example.com/data');
    return { content: [{ type: 'text' as const, text: await response.text() }] };
});

server.tool('get-fixed', {}, async () => {
    // ok: mcp-ssrf-typescript
    const response = await axios.get('https://api.example.com/items');
    return { content: [{ type: 'text' as const, text: JSON.stringify(response.data) }] };
});

// fetch outside any MCP handler — not in scope for this rule
async function unrelatedFetch(url: string) {
    // ok: mcp-ssrf-typescript
    const response = await fetch(url);
    return response.text();
}
