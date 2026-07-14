import google.generativeai as genai

model = genai.GenerativeModel("gemini-pro")

# ruleid: gemini-missing-safety-settings-python
response = model.generate_content("Tell me about history")

# ok: gemini-missing-safety-settings-python
response = model.generate_content(
    "Tell me about history",
    safety_settings=safety_config
)
