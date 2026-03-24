import os
import google.generativeai as genai
from google import genai as genai2

# ruleid: gemini-hardcoded-api-key-python
genai.configure(api_key="AIzaSyA1234567890abcdefghijklmnopqrs")

# ruleid: gemini-hardcoded-api-key-python
client = genai2.Client(api_key="AIzaSyA1234567890abcdefghijklmnopqrs")

# ok: gemini-hardcoded-api-key-python
genai.configure(api_key=os.environ["GOOGLE_API_KEY"])

# ok: gemini-hardcoded-api-key-python
client = genai2.Client(api_key=get_secret("google"))

# ok: gemini-hardcoded-api-key-python
genai.configure(api_key="not-a-real-key")
