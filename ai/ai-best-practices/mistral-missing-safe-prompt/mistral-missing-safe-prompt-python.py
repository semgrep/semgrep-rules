from mistralai import Mistral

client = Mistral(api_key=os.environ["MISTRAL_API_KEY"])

# ruleid: mistral-missing-safe-prompt-python
response = client.chat.complete(
    model="mistral-large-latest",
    messages=[{"role": "user", "content": "Hello"}]
)

# ok: mistral-missing-safe-prompt-python
response = client.chat.complete(
    model="mistral-large-latest",
    messages=[{"role": "user", "content": "Hello"}],
    safe_prompt=True
)
