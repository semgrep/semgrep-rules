const express = require('express');
const Anthropic = require('@anthropic-ai/sdk');

async function vulnerable(req, res) {
    const client = new Anthropic();
    const userInput = req.body.input;
    const response = await client.messages.create({
        model: "claude-sonnet-4-5-20250929",
        max_tokens: 1024,
        // ruleid: anthropic-user-input-in-system-prompt-js
        system: userInput,
        messages: [{role: "user", content: "Hello"}]
    });
}

async function safe(req, res) {
    const client = new Anthropic();
    const userInput = req.body.input;
    const response = await client.messages.create({
        model: "claude-sonnet-4-5-20250929",
        max_tokens: 1024,
        // ok: anthropic-user-input-in-system-prompt-js
        system: "You are a helpful assistant",
        messages: [{role: "user", content: userInput}]
    });
}

async function vulnerable_formatted(req, res) {
    const client = new Anthropic();
    const persona = req.query.persona;
    const systemPrompt = `You are a ${persona}`;
    const response = await client.messages.create({
        model: "claude-sonnet-4-5-20250929",
        max_tokens: 1024,
        // ruleid: anthropic-user-input-in-system-prompt-js
        system: systemPrompt,
        messages: [{role: "user", content: "Hello"}]
    });
}
