// ruleid: detect-gemini
const { GoogleGenerativeAI } = require("@google/generative-ai");

// Access your API key as an environment variable (see "Set up your API key" above)
// ruleid: detect-gemini
const genAI = new GoogleGenerativeAI(process.env.API_KEY);

// ruleid: detect-gemini
const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash"});