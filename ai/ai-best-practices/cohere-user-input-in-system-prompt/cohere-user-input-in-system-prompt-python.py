from flask import request
import cohere

def vulnerable():
    client = cohere.Client("api-key")
    user_input = request.args.get("input")
    response = client.chat(
        message="Hello",
        # ruleid: cohere-user-input-in-system-prompt-python
        preamble=user_input
    )

def safe():
    client = cohere.Client("api-key")
    user_input = request.args.get("input")
    response = client.chat(
        message="Hello",
        # ok: cohere-user-input-in-system-prompt-python
        preamble="You are a helpful assistant"
    )

def vulnerable_formatted():
    client = cohere.Client("api-key")
    persona = request.args.get("persona")
    preamble_text = f"You are a {persona}"
    response = client.chat(
        message="Hello",
        # ruleid: cohere-user-input-in-system-prompt-python
        preamble=preamble_text
    )
