const { OpenAI } = require("openai");

const client = new OpenAI();

async function test() {
    const response = await client.chat.completions.create({
        model: "gpt-4",
        messages: [{ role: "user", content: "Hello" }]
    });

    // ruleid: openai-missing-refusal-check-javascript
    const content = response.choices[0].message.content;

    // ok: openai-missing-refusal-check-javascript
    if (response.choices[0].message.refusal) {
        handleRefusal();
    } else {
        const safeContent = response.choices[0].message.content;
    }
}
