from openai import OpenAI

client = OpenAI()

response = client.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": "Hello"}]
)

# ruleid: openai-missing-refusal-check-python
content = response.choices[0].message.content

# ok: openai-missing-refusal-check-python
if response.choices[0].message.refusal:
    handle_refusal()
else:
    content = response.choices[0].message.content

# ok: openai-missing-refusal-check-python
if response.choices[0].message.refusal is not None:
    handle_refusal()
else:
    content = response.choices[0].message.content
