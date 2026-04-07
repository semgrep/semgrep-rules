import anthropic

client = anthropic.Anthropic()

# ruleid: anthropic-missing-system-prompt-python
response = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}]
)

# ok: anthropic-missing-system-prompt-python
response = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    system="You are a helpful assistant.",
    messages=[{"role": "user", "content": "Hello"}]
)
