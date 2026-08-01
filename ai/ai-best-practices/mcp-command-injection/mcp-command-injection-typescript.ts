import { exec, execSync, execFile } from 'child_process';
import * as cp from 'child_process';
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { z } from 'zod';

const server = new McpServer({ name: 'test-server', version: '1.0.0' });

// --- TRUE POSITIVES ---

server.tool('run-command', { command: z.string() }, async (args) => {
    // ruleid: mcp-command-injection-typescript
    exec(args.command, (err, stdout) => { console.log(stdout); });
    return { content: [{ type: 'text' as const, text: 'done' }] };
});

server.tool('run-sync', { command: z.string() }, async ({ command }) => {
    // ruleid: mcp-command-injection-typescript
    const result = execSync(command);
    return { content: [{ type: 'text' as const, text: result.toString() }] };
});

server.tool('eval-input', 'Evaluate an expression', { code: z.string() }, async ({ code }) => {
    // ruleid: mcp-command-injection-typescript
    const result = eval(code);
    return { content: [{ type: 'text' as const, text: String(result) }] };
});

server.tool('cp-run', { cmd: z.string() }, async ({ cmd }) => {
    // ruleid: mcp-command-injection-typescript
    cp.exec(cmd);
    return { content: [{ type: 'text' as const, text: 'done' }] };
});

// v2 registerTool API
server.registerTool(
    'run-v2',
    { description: 'Run a command', inputSchema: z.object({ command: z.string() }) },
    async ({ command }) => {
        // ruleid: mcp-command-injection-typescript
        execSync(command);
        return { content: [{ type: 'text' as const, text: 'done' }] };
    }
);

// --- TRUE NEGATIVES ---

server.tool('list-files', {}, async () => {
    // ok: mcp-command-injection-typescript
    // Hardcoded string literal — not user-controlled
    exec('ls -la /tmp', (err, stdout) => { console.log(stdout); });
    return { content: [{ type: 'text' as const, text: 'done' }] };
});

server.tool('safe-run', { filename: z.string() }, async ({ filename }) => {
    // ok: mcp-command-injection-typescript
    // execFile does not invoke a shell — safe API
    execFile('cat', [filename]);
    return { content: [{ type: 'text' as const, text: 'done' }] };
});

// exec outside any MCP handler — not in scope for this rule
function unrelatedFunction(cmd: string) {
    // ok: mcp-command-injection-typescript
    exec(cmd);
}
