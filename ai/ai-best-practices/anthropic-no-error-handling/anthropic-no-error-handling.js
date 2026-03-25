const Anthropic = require('@anthropic-ai/sdk');

const client = new Anthropic();

async function noTry() {
    // ruleid: anthropic-no-error-handling-javascript
    const response = await client.messages.create({
        model: "claude-sonnet-4-5-20250929",
        max_tokens: 1024,
        messages: [{role: "user", content: "Hello"}]
    });
    return response;
}

async function noTryDirect() {
    // ruleid: anthropic-no-error-handling-javascript
    client.messages.create({
        model: "claude-sonnet-4-5-20250929",
        max_tokens: 1024,
        messages: [{role: "user", content: "Hello"}]
    });
}

async function withTry() {
    try {
        // ok: anthropic-no-error-handling-javascript
        const response = await client.messages.create({
            model: "claude-sonnet-4-5-20250929",
            max_tokens: 1024,
            messages: [{role: "user", content: "Hello"}]
        });
    } catch (error) {
        handleError(error);
    }
}

async function withSpecificCatch() {
    try {
        // ok: anthropic-no-error-handling-javascript
        const response = await client.messages.create({
            model: "claude-sonnet-4-5-20250929",
            max_tokens: 1024,
            messages: [{role: "user", content: "Hello"}]
        });
    } catch (e) {
        if (e instanceof Anthropic.RateLimitError) {
            handleRateLimit(e);
        }
    }
}
