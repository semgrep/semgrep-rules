const express = require('express');
const { CohereClient } = require('cohere-ai');

async function vulnerable(req, res) {
    const client = new CohereClient({token: "api-key"});
    const userInput = req.body.input;
    const response = await client.chat({
        message: "Hello",
        // ruleid: cohere-user-input-in-system-prompt-js
        preamble: userInput,
    });
}

async function safe(req, res) {
    const client = new CohereClient({token: "api-key"});
    const userInput = req.body.input;
    const response = await client.chat({
        message: "Hello",
        // ok: cohere-user-input-in-system-prompt-js
        preamble: "You are a helpful assistant",
    });
}

async function vulnerable_formatted(req, res) {
    const client = new CohereClient({token: "api-key"});
    const persona = req.query.persona;
    const preambleText = `You are a ${persona}`;
    const response = await client.chat({
        message: "Hello",
        // ruleid: cohere-user-input-in-system-prompt-js
        preamble: preambleText,
    });
}
