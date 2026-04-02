const { CohereClient } = require("cohere-ai");
const co = new CohereClient({ token: process.env.COHERE_API_KEY });

async function test() {
    // ruleid: cohere-missing-safety-mode-javascript
    const response = await co.chat({
        model: "command-a-03-2025",
        messages: [{ role: "user", content: "Hello" }]
    });

    // ok: cohere-missing-safety-mode-javascript
    const response2 = await co.chat({
        model: "command-a-03-2025",
        messages: [{ role: "user", content: "Hello" }],
        safetyMode: "STRICT"
    });
}
