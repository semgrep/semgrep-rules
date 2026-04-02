from openai import OpenAI

client = OpenAI()

# ruleid: openai-missing-safety-identifier-python
response = client.responses.create(
    model="gpt-4.1",
    input="Hello, how are you?"
)

# ok: openai-missing-safety-identifier-python
response = client.responses.create(
    model="gpt-4.1",
    input="Hello, how are you?",
    safety_identifier="user_abc123"
)
