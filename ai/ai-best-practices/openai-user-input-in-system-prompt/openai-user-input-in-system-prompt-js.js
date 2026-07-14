const express = require('express');
const OpenAI = require('openai');

async function vulnerable(req, res) {
    const client = new OpenAI();
    const userInput = req.body.input;
    const response = await client.chat.completions.create({
        model: "gpt-4",
        messages: [
            // ruleid: openai-user-input-in-system-prompt-js
            {role: "system", content: userInput},
            {role: "user", content: "Hello"}
        ]
    });
}

async function safe_hardcoded(req, res) {
    const client = new OpenAI();
    const userInput = req.body.input;
    const response = await client.chat.completions.create({
        model: "gpt-4",
        messages: [
            // ok: openai-user-input-in-system-prompt-js
            {role: "system", content: "You are a helpful assistant"},
            {role: "user", content: userInput}
        ]
    });
}

async function vulnerable_formatted(req, res) {
    const client = new OpenAI();
    const topic = req.query.topic;
    const systemMsg = `You are an expert on ${topic}`;
    const response = await client.chat.completions.create({
        model: "gpt-4",
        messages: [
            // ruleid: openai-user-input-in-system-prompt-js
            {role: "system", content: systemMsg},
        ]
    });
}
