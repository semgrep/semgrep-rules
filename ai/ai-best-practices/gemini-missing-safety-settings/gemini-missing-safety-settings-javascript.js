const { GoogleGenerativeAI } = require("@google/generative-ai");

const genAI = new GoogleGenerativeAI("api-key");
const model = genAI.getGenerativeModel({ model: "gemini-pro" });

async function test() {
    // ruleid: gemini-missing-safety-settings-javascript
    const response = await model.generateContent({
        contents: [{ role: "user", parts: [{ text: "Hello" }] }]
    });

    // ok: gemini-missing-safety-settings-javascript
    const response2 = await model.generateContent({
        contents: [{ role: "user", parts: [{ text: "Hello" }] }],
        safetySettings: safetyConfig
    });
}
