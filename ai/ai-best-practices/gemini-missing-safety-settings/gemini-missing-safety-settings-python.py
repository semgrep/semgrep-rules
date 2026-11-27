
from google import genai
from google.genai import types

client = genai.Client()

# ruleid: gemini-missing-safety-settings-python
response = client.models.generate_content(
    model="gemini-3-flash-preview",
    contents="Tell me about history",
)

# ok: gemini-missing-safety-settings-python
response = client.model.generate_content(
    model="gemini-3-flash-preview",
    content="Tell me about history",
    config={
        "safety_settings": safety_config
    }
)
