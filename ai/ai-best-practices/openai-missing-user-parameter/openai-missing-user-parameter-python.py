from openai import OpenAI

client = OpenAI()

# ruleid: openai-missing-user-parameter-python
response = client.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": "Hello"}]
)

# ok: openai-missing-user-parameter-python
response = client.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": "Hello"}],
    user="user-123"
)
