const express = require('express');
const { Mistral } = require('@mistralai/mistralai');

async function vulnerable(req, res) {
    const client = new Mistral({apiKey: "key"});
    const userInput = req.body.input;
    const response = await client.chat.complete({
        model: "mistral-large-latest",
        messages: [
            // ruleid: mistral-user-input-in-system-prompt-js
            {role: "system", content: userInput},
            {role: "user", content: "Hello"}
        ]
    });
}

async function safe_hardcoded(req, res) {
    const client = new Mistral({apiKey: "key"});
    const userInput = req.body.input;
    const response = await client.chat.complete({
        model: "mistral-large-latest",
        messages: [
            // ok: mistral-user-input-in-system-prompt-js
            {role: "system", content: "You are a helpful assistant"},
            {role: "user", content: userInput}
        ]
    });
}

async function vulnerable_formatted(req, res) {
    const client = new Mistral({apiKey: "key"});
    const topic = req.query.topic;
    const systemMsg = `You are an expert on ${topic}`;
    const response = await client.chat.complete({
        model: "mistral-large-latest",
        messages: [
            // ruleid: mistral-user-input-in-system-prompt-js
            {role: "system", content: systemMsg},
        ]
    });
}
