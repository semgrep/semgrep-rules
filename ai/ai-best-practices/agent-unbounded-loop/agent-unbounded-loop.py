from openai import OpenAI
client = OpenAI()

# In a while True loop with no break
while True:
    # ruleid: agent-unbounded-loop-python
    response = client.chat.completions.create(model="gpt-4", messages=[{"role": "user", "content": "Hello"}])
    print(response)

# With a break condition — safe
while True:
    # ok: agent-unbounded-loop-python
    response = client.chat.completions.create(model="gpt-4", messages=[{"role": "user", "content": "Hello"}])
    if response.choices[0].message.content == "done":
        break
