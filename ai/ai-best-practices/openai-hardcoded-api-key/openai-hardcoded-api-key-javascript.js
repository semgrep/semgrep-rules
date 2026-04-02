const { OpenAI } = require("openai");

// ruleid: openai-hardcoded-api-key-javascript
const client = new OpenAI({apiKey: "sk-1234567890abcdef"});

// ruleid: openai-hardcoded-api-key-javascript
const client2 = new OpenAI({apiKey: "sk-proj-abc123"});

// ok: openai-hardcoded-api-key-javascript
const client3 = new OpenAI({apiKey: process.env.OPENAI_API_KEY});

// ok: openai-hardcoded-api-key-javascript
const client4 = new OpenAI({apiKey: getSecret("openai")});

// ok: openai-hardcoded-api-key-javascript
const client5 = new OpenAI();

// ok: openai-hardcoded-api-key-javascript
const client6 = new OpenAI({apiKey: "not-a-real-key"});
