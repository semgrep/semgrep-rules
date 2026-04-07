import anthropic

client = anthropic.Anthropic()

# ruleid: anthropic-missing-max-tokens-python
response = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    messages=[{"role": "user", "content": "Hello"}]
)

# ok: anthropic-missing-max-tokens-python
response = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}]
)
