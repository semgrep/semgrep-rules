import os
from openai import OpenAI, AsyncOpenAI

# ruleid: openai-hardcoded-api-key-python
client = OpenAI(api_key="sk-1234567890abcdef")

# ruleid: openai-hardcoded-api-key-python
client = AsyncOpenAI(api_key="sk-proj-abc123")

# ok: openai-hardcoded-api-key-python
client = OpenAI(api_key=os.environ["OPENAI_API_KEY"])

# ok: openai-hardcoded-api-key-python
client = OpenAI(api_key=get_secret("openai"))

# ok: openai-hardcoded-api-key-python
client = OpenAI()

# ok: openai-hardcoded-api-key-python
client = OpenAI(api_key="not-a-real-key")
