const { OpenAI } = require("openai");
const { exec } = require("child_process");

const client = new OpenAI();

async function vulnerableEval() {
    const response = await client.chat.completions.create({model: "gpt-4", messages: [{role: "user", content: "generate code"}]});
    const code = response.choices[0].message.content;
    // ruleid: llm-output-to-exec-javascript
    eval(code);
}

async function safeUsage() {
    const response = await client.chat.completions.create({model: "gpt-4", messages: [{role: "user", content: "Hello"}]});
    // ok: llm-output-to-exec-javascript
    const content = response.choices[0].message.content;
    console.log(content);
}
