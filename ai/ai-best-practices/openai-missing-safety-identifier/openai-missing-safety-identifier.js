const OpenAI = require("openai");
const client = new OpenAI();

async function test() {
    // ruleid: openai-missing-safety-identifier-javascript
    const response = await client.responses.create({
        model: "gpt-4.1",
        input: "Hello, how are you?"
    });

    // ok: openai-missing-safety-identifier-javascript
    const response2 = await client.responses.create({
        model: "gpt-4.1",
        input: "Hello, how are you?",
        safety_identifier: "user_abc123"
    });
}
