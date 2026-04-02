const { CohereClient } = require("cohere-ai");

// ruleid: cohere-hardcoded-api-key-javascript
const client = new CohereClient({token: "abcdef1234567890"});

// ok: cohere-hardcoded-api-key-javascript
const client2 = new CohereClient({token: process.env.COHERE_API_KEY});

// ok: cohere-hardcoded-api-key-javascript
const client3 = new CohereClient({token: getSecret("cohere")});

// ok: cohere-hardcoded-api-key-javascript
const client4 = new CohereClient();
