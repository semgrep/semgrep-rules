from anthropic import Anthropic

client = Anthropic()

# ruleid: anthropic-missing-metadata-user-id-python
response = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}]
)

# ok: anthropic-missing-metadata-user-id-python
response = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}],
    metadata={"user_id": "hashed_user_123"}
)
