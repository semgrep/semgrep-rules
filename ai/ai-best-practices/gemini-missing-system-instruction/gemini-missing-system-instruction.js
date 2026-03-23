const { GoogleGenerativeAI } = require("@google/generative-ai");
const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);

async function test() {
    // ruleid: gemini-missing-system-instruction-javascript
    const model = genAI.getGenerativeModel({
        model: "gemini-pro"
    });

    // ok: gemini-missing-system-instruction-javascript
    const model2 = genAI.getGenerativeModel({
        model: "gemini-pro",
        systemInstruction: "You are a helpful assistant."
    });
}
