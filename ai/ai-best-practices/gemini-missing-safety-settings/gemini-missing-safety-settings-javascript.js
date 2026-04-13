import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({});

async function test() {
    // ruleid: gemini-missing-safety-settings-javascript
    const response = await ai.models.generateContent({
        model: "gemini-3-flash-preview",
        contents: "Hello",
    });

    // ok: gemini-missing-safety-settings-javascript
    const response2 = await ai.models.generateContent({
        model: "gemini-3-flash-preview",
        contents: "Hello",
        config: { safetySettings: safetyConfig }
    });
}
