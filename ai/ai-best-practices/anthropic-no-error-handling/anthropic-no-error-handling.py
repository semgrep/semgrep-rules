import anthropic

client = anthropic.Anthropic()

# ruleid: anthropic-no-error-handling
response = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}]
)

def no_try():
    # ruleid: anthropic-no-error-handling
    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=1024,
        messages=[{"role": "user", "content": "Hello"}]
    )
    return response

# ok: anthropic-no-error-handling
try:
    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=1024,
        messages=[{"role": "user", "content": "Hello"}]
    )
except Exception as e:
    handle_error(e)

def with_try():
    try:
        # ok: anthropic-no-error-handling
        response = client.messages.create(
            model="claude-sonnet-4-5-20250929",
            max_tokens=1024,
            messages=[{"role": "user", "content": "Hello"}]
        )
    except anthropic.RateLimitError as e:
        handle_rate_limit(e)
