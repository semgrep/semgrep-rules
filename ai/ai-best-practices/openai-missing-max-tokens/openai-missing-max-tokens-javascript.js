const OpenAI = require("openai");

const client = new OpenAI();

async function test() {
    // ruleid: openai-missing-max-tokens-javascript
    const response = await client.chat.completions.create({
        model: "gpt-4",
        messages: [{ role: "user", content: "Hello" }]
    });

    // ok: openai-missing-max-tokens-javascript
    const response2 = await client.chat.completions.create({
        model: "gpt-4",
        max_tokens: 1024,
        messages: [{ role: "user", content: "Hello" }]
    });
}
