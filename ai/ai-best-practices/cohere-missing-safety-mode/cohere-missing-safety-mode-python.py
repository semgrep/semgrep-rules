import cohere

co = cohere.ClientV2(api_key=os.environ["COHERE_API_KEY"])

# ruleid: cohere-missing-safety-mode-python
response = co.chat(
    model="command-a-03-2025",
    messages=[{"role": "user", "content": "Hello"}]
)

# ok: cohere-missing-safety-mode-python
response = co.chat(
    model="command-a-03-2025",
    messages=[{"role": "user", "content": "Hello"}],
    safety_mode="STRICT"
)

# ok: cohere-missing-safety-mode-python
response = co.chat(
    model="command-a-03-2025",
    messages=[{"role": "user", "content": "Hello"}],
    safety_mode="CONTEXTUAL"
)
