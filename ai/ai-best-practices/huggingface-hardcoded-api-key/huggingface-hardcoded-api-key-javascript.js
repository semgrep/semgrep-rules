const { InferenceClient } = require("@huggingface/inference");

// ruleid: huggingface-hardcoded-api-key-javascript
const client = new InferenceClient("hf_abcdefghijklmnopqrstuvwxyz1234");

// ruleid: huggingface-hardcoded-api-key-javascript
const client2 = new InferenceClient("hf_abcdefghijklmnopqrstuvwxyz1234", { endpointUrl: "https://example.com" });

// ok: huggingface-hardcoded-api-key-javascript
const client3 = new InferenceClient(process.env.HF_TOKEN);

// ok: huggingface-hardcoded-api-key-javascript
const client4 = new InferenceClient(hfToken);
