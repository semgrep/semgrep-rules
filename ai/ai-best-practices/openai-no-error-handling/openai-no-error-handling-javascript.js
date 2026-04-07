const OpenAI = require('openai');

const client = new OpenAI();

async function noTry() {
    // ruleid: openai-no-error-handling-javascript
    const response = await client.chat.completions.create({
        model: "gpt-4",
        messages: [{role: "user", content: "Hello"}]
    });
    return response;
}

async function noTryDirect() {
    // ruleid: openai-no-error-handling-javascript
    client.chat.completions.create({
        model: "gpt-4",
        messages: [{role: "user", content: "Hello"}]
    });
}

async function withTry() {
    try {
        // ok: openai-no-error-handling-javascript
        const response = await client.chat.completions.create({
            model: "gpt-4",
            messages: [{role: "user", content: "Hello"}]
        });
    } catch (error) {
        handleError(error);
    }
}

async function withSpecificCatch() {
    try {
        // ok: openai-no-error-handling-javascript
        const response = await client.chat.completions.create({
            model: "gpt-4",
            messages: [{role: "user", content: "Hello"}]
        });
    } catch (e) {
        if (e instanceof OpenAI.RateLimitError) {
            handleRateLimit(e);
        }
    }
}
