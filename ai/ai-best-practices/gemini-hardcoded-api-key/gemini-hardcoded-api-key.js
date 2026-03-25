const { GoogleGenerativeAI } = require("@google/generative-ai");

// ruleid: gemini-hardcoded-api-key-javascript
const genAI = new GoogleGenerativeAI("AIzaSyA1234567890abcdefghijklmnopqrs");

// ok: gemini-hardcoded-api-key-javascript
const genAI2 = new GoogleGenerativeAI(process.env.GOOGLE_API_KEY);

// ok: gemini-hardcoded-api-key-javascript
const genAI3 = new GoogleGenerativeAI(apiKey);

// ok: gemini-hardcoded-api-key-javascript
const genAI4 = new GoogleGenerativeAI("not-a-real-key");
