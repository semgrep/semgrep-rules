// ruleid: detect-vercel-ai
import { generateText } from "ai"
// ruleid: detect-vercel-ai
import { openai } from "@ai-sdk/openai"
// ruleid: detect-vercel-ai
const { text } = await generateText({
    model: openai("gpt-4-turbo"),
    prompt: "What is love?"
})

// ruleid: detect-vercel-ai
import { generateText } from "ai"
// ruleid: detect-vercel-ai
import { anthropic } from "@ai-sdk/anthropic"
// ruleid: detect-vercel-ai
const { text } = await generateText({
    model: anthropic("claude-3-opus-20240229"),
    prompt: "What is love?"
})

// ruleid: detect-vercel-ai
import { generateText } from "ai"
// ruleid: detect-vercel-ai
import { google } from "@ai-sdk/google"
// ruleid: detect-vercel-ai
const { text } = await generateText({
    model: google("models/gemini-1.5-pro-latest"),
    prompt: "What is love?"
})

// ruleid: detect-vercel-ai
import { generateText } from "ai"
// ruleid: detect-vercel-ai
import { mistral } from "@ai-sdk/mistral"
// ruleid: detect-vercel-ai
const { text } = await generateText({
    model: mistral("mistral-large-latest"),
    prompt: "What is love?"
})

// ruleid: detect-vercel-ai
import { generateText } from "ai"
// ruleid: detect-vercel-ai
import { custom } from "@ai-sdk/custom"
// ruleid: detect-vercel-ai
const { text } = await generateText({
    model: custom("mistral-large-latest"),
    prompt: "What is love?"
})