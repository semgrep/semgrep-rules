const { OpenAI } = require("openai");

const client = new OpenAI();

async function test() {
    // ruleid: openai-missing-user-parameter-javascript
    const response = await client.chat.completions.create({
        model: "gpt-4",
        messages: [{ role: "user", content: "Hello" }]
    });

    // ok: openai-missing-user-parameter-javascript
    const response2 = await client.chat.completions.create({
        model: "gpt-4",
        messages: [{ role: "user", content: "Hello" }],
        user: "user-123"
    });
}
