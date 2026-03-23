const { Mistral } = require("@mistralai/mistralai");

// ruleid: mistral-hardcoded-api-key-javascript
const client = new Mistral({apiKey: "mySecretKey123456"});

// ok: mistral-hardcoded-api-key-javascript
const client2 = new Mistral({apiKey: process.env.MISTRAL_API_KEY});

// ok: mistral-hardcoded-api-key-javascript
const client3 = new Mistral({apiKey: getSecret("mistral")});

// ok: mistral-hardcoded-api-key-javascript
const client4 = new Mistral();
