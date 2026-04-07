from flask import request
from anthropic import Anthropic

def vulnerable():
    client = Anthropic()
    user_input = request.args.get("input")
    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=1024,
        # ruleid: anthropic-user-input-in-system-prompt-python
        system=user_input,
        messages=[{"role": "user", "content": "Hello"}]
    )

def safe():
    client = Anthropic()
    user_input = request.args.get("input")
    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=1024,
        # ok: anthropic-user-input-in-system-prompt-python
        system="You are a helpful assistant",
        messages=[{"role": "user", "content": user_input}]
    )

def vulnerable_formatted():
    client = Anthropic()
    persona = request.args.get("persona")
    system_prompt = f"You are a {persona}"
    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=1024,
        # ruleid: anthropic-user-input-in-system-prompt-python
        system=system_prompt,
        messages=[{"role": "user", "content": "Hello"}]
    )
