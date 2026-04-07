const express = require('express');
const { GoogleGenerativeAI } = require('@google/generative-ai');

async function vulnerable(req, res) {
    const genAI = new GoogleGenerativeAI("api-key");
    const userInput = req.body.input;
    const model = genAI.getGenerativeModel({
        model: "gemini-pro",
        // ruleid: gemini-user-input-in-system-prompt-js
        systemInstruction: userInput,
    });
}

async function safe(req, res) {
    const genAI = new GoogleGenerativeAI("api-key");
    const userInput = req.body.input;
    const model = genAI.getGenerativeModel({
        model: "gemini-pro",
        // ok: gemini-user-input-in-system-prompt-js
        systemInstruction: "You are a helpful assistant",
    });
}

async function vulnerable_formatted(req, res) {
    const genAI = new GoogleGenerativeAI("api-key");
    const persona = req.query.persona;
    const instruction = `You are a ${persona}`;
    const model = genAI.getGenerativeModel({
        model: "gemini-pro",
        // ruleid: gemini-user-input-in-system-prompt-js
        systemInstruction: instruction,
    });
}
