from flask import request
import google.generativeai as genai

def vulnerable():
    instruction = request.args.get("instruction")
    model = genai.GenerativeModel(
        "gemini-pro",
        # ruleid: gemini-user-input-in-system-prompt-python
        system_instruction=instruction
    )

def safe():
    user_input = request.args.get("input")
    model = genai.GenerativeModel(
        "gemini-pro",
        # ok: gemini-user-input-in-system-prompt-python
        system_instruction="You are a helpful assistant"
    )

def vulnerable_formatted():
    persona = request.args.get("persona")
    instruction = f"You are a {persona}"
    model = genai.GenerativeModel(
        "gemini-pro",
        # ruleid: gemini-user-input-in-system-prompt-python
        system_instruction=instruction
    )
