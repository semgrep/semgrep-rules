const Anthropic = require("@anthropic-ai/sdk");

const client = new Anthropic();

async function test() {
    const response = await client.messages.create({
        model: "claude-sonnet-4-5-20250929",
        max_tokens: 1024,
        messages: [{ role: "user", content: "Hello" }]
    });
    // ruleid: anthropic-missing-refusal-check-javascript
    const text = response.content;

    const response2 = await client.messages.create({
        model: "claude-sonnet-4-5-20250929",
        max_tokens: 1024,
        messages: [{ role: "user", content: "Hello" }]
    });
    if (response2.stop_reason === "end_turn") {
        // ok: anthropic-missing-refusal-check-javascript
        const text2 = response2.content;
    }
}
