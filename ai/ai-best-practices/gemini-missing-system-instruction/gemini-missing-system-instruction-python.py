import google.generativeai as genai

# ruleid: gemini-missing-system-instruction-python
model = genai.GenerativeModel("gemini-pro")

# ruleid: gemini-missing-system-instruction-python
model = genai.GenerativeModel(
    "gemini-pro",
    safety_settings=safety_config
)

# ok: gemini-missing-system-instruction-python
model = genai.GenerativeModel(
    "gemini-pro",
    system_instruction="You are a helpful assistant."
)

# ok: gemini-missing-system-instruction-python
model = genai.GenerativeModel(
    "gemini-pro",
    system_instruction="You are a helpful assistant.",
    safety_settings=safety_config
)
