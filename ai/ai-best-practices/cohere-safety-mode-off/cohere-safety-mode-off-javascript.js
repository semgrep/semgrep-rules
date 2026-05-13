const { CohereClient } = require("cohere-ai");
const co = new CohereClient({ token: process.env.COHERE_API_KEY });

async function test() {
    // ruleid: cohere-safety-mode-off-javascript
    const response = await co.chat({
        model: "command-r",
        messages: [{ role: "user", content: "Hello" }],
        safetyMode: "OFF"
    });

    // ok: cohere-safety-mode-off-javascript
    const response2 = await co.chat({
        model: "command-r",
        messages: [{ role: "user", content: "Hello" }],
        safetyMode: "STRICT"
    });
}
