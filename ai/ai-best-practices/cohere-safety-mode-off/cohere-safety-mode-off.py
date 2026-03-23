import cohere
import os

co = cohere.ClientV2(api_key=os.environ["COHERE_API_KEY"])

# ruleid: cohere-safety-mode-off-python
response = co.chat(
    model="command-r",
    messages=[{"role": "user", "content": "Hello"}],
    safety_mode="OFF"
)

# ok: cohere-safety-mode-off-python
response = co.chat(
    model="command-r",
    messages=[{"role": "user", "content": "Hello"}],
    safety_mode="STRICT"
)

# ok: cohere-safety-mode-off-python
response = co.chat(
    model="command-r",
    messages=[{"role": "user", "content": "Hello"}],
    safety_mode="CONTEXTUAL"
)
