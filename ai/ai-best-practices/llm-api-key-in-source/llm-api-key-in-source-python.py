import os

# ruleid: llm-api-key-in-source-python
api_key = "sk-abcdefghijklmnopqrstuvwxyz1234567890"

# ruleid: llm-api-key-in-source-python
openai_key = "sk-proj-abcdefghijklmnopqrstuvwxyz"

# ruleid: llm-api-key-in-source-python
anthropic_key = "sk-ant-api03-abcdefghijklmnopqrstuvwxyz"

# ruleid: llm-api-key-in-source-python
google_key = "AIzaSyAbcdefghijklmnopqrstuvwxyz1234567890"

# ruleid: llm-api-key-in-source-python
hf_token = "hf_abcdefghijklmnopqrstuvwxyz1234"

# ok: llm-api-key-in-source-python
api_key = os.environ["OPENAI_API_KEY"]

# ok: llm-api-key-in-source-python
api_key = get_secret("openai")

# ok: llm-api-key-in-source-python
short_key = "sk-short"

# ok: llm-api-key-in-source-python
not_a_key = "hello world"
