const OpenAI = require("openai");
const client = new OpenAI();

// ruleid: openai-missing-system-message-js
const response = client.chat.completions.create({
    model: "gpt-4",
    messages: [
        {role: "user", content: "Hello"}
    ]
});

// ok: openai-missing-system-message-js
const response2 = client.chat.completions.create({
    model: "gpt-4",
    messages: [
        {role: "system", content: "You are helpful"},
        {role: "user", content: "Hello"}
    ]
});
