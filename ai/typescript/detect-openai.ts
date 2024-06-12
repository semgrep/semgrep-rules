// ruleid: detect-openai
import OpenAI from "openai";

OPENAI_API_KEY = "asdf"

// ruleid: detect-openai
const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY,
});

// ruleid: detect-openai
const chatCompletion = await openai.chat.completions.create({
    messages: [{ role: "user", content: "Say this is a test" }],
    model: "gpt-3.5-turbo",
});