import anthropic

client = anthropic.Anthropic()

response = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}]
)
# ruleid: anthropic-missing-refusal-check-python
text = response.content

response2 = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}]
)
if response2.stop_reason == "end_turn":
    # ok: anthropic-missing-refusal-check-python
    text2 = response2.content

response3 = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}]
)
if response3.stop_reason != "end_turn":
    handle_error()
else:
    # ok: anthropic-missing-refusal-check-python
    text3 = response3.content
