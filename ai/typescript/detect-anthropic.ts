// ruleid: detect-anthropic
import Anthropic from '@anthropic-ai/sdk';

// ruleid: detect-anthropic
const anthropic = new Anthropic({
  apiKey: 'my_api_key', // defaults to process.env["ANTHROPIC_API_KEY"]
});

// ruleid: detect-anthropic
const msg = await anthropic.messages.create({
  model: "claude-3-opus-20240229",
  max_tokens: 1024,
  messages: [{ role: "user", content: "Hello, Claude" }],
});
console.log(msg);