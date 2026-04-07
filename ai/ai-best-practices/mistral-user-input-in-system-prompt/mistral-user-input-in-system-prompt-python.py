from flask import request
from mistralai import Mistral

def vulnerable_system_prompt():
    client = Mistral(api_key="key")
    user_input = request.args.get("input")
    response = client.chat.complete(
        model="mistral-large-latest",
        messages=[
            # ruleid: mistral-user-input-in-system-prompt-python
            {"role": "system", "content": user_input},
            {"role": "user", "content": "Hello"}
        ]
    )

def safe_hardcoded_system():
    client = Mistral(api_key="key")
    user_input = request.args.get("input")
    response = client.chat.complete(
        model="mistral-large-latest",
        messages=[
            # ok: mistral-user-input-in-system-prompt-python
            {"role": "system", "content": "You are a helpful assistant"},
            {"role": "user", "content": user_input}
        ]
    )

def vulnerable_formatted():
    client = Mistral(api_key="key")
    topic = request.args.get("topic")
    system_msg = f"You are an expert on {topic}"
    response = client.chat.complete(
        model="mistral-large-latest",
        messages=[
            # ruleid: mistral-user-input-in-system-prompt-python
            {"role": "system", "content": system_msg},
        ]
    )
