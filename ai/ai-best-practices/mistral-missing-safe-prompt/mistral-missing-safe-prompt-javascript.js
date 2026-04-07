const { Mistral } = require("@mistralai/mistralai");
const client = new Mistral({ apiKey: process.env.MISTRAL_API_KEY });

async function test() {
    // ruleid: mistral-missing-safe-prompt-javascript
    const response = await client.chat.complete({
        model: "mistral-large-latest",
        messages: [{ role: "user", content: "Hello" }]
    });

    // ok: mistral-missing-safe-prompt-javascript
    const response2 = await client.chat.complete({
        model: "mistral-large-latest",
        messages: [{ role: "user", content: "Hello" }],
        safePrompt: true
    });
}
