from flask import request
from openai import OpenAI

def vulnerable_system_prompt():
    client = OpenAI()
    user_input = request.args.get("input")
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[
            # ruleid: openai-user-input-in-system-prompt-python
            {"role": "system", "content": user_input},
            {"role": "user", "content": "Hello"}
        ]
    )

def safe_hardcoded_system():
    client = OpenAI()
    user_input = request.args.get("input")
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[
            # ok: openai-user-input-in-system-prompt-python
            {"role": "system", "content": "You are a helpful assistant"},
            {"role": "user", "content": user_input}
        ]
    )

def vulnerable_formatted():
    client = OpenAI()
    topic = request.args.get("topic")
    system_msg = f"You are an expert on {topic}"
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[
            # ruleid: openai-user-input-in-system-prompt-python
            {"role": "system", "content": system_msg},
        ]
    )
