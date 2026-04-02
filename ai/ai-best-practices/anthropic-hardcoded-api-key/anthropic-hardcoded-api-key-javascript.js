const Anthropic = require("@anthropic-ai/sdk");

// ruleid: anthropic-hardcoded-api-key-javascript
const client = new Anthropic({apiKey: "sk-ant-api03-abcdef1234567890"});

// ok: anthropic-hardcoded-api-key-javascript
const client2 = new Anthropic({apiKey: process.env.ANTHROPIC_API_KEY});

// ok: anthropic-hardcoded-api-key-javascript
const client3 = new Anthropic({apiKey: getSecret("anthropic")});

// ok: anthropic-hardcoded-api-key-javascript
const client4 = new Anthropic();

// ok: anthropic-hardcoded-api-key-javascript
const client5 = new Anthropic({apiKey: "not-a-real-key"});
