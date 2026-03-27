from openai import OpenAI

client = OpenAI()

# ruleid: openai-missing-max-tokens-python
response = client.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": "Hello"}]
)

# ok: openai-missing-max-tokens-python
response = client.chat.completions.create(
    model="gpt-4",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}]
)

# ok: openai-missing-max-tokens-python
response = client.chat.completions.create(
    model="gpt-4",
    max_tokens=500,
    messages=[{"role": "user", "content": "Hello"}],
    user="user-123"
)
