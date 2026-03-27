import os
from anthropic import Anthropic, AsyncAnthropic

# ruleid: anthropic-hardcoded-api-key-python
client = Anthropic(api_key="sk-ant-api03-abcdef1234567890")

# ruleid: anthropic-hardcoded-api-key-python
client = AsyncAnthropic(api_key="sk-ant-key123456")

# ok: anthropic-hardcoded-api-key-python
client = Anthropic(api_key=os.environ["ANTHROPIC_API_KEY"])

# ok: anthropic-hardcoded-api-key-python
client = Anthropic(api_key=get_secret("anthropic"))

# ok: anthropic-hardcoded-api-key-python
client = Anthropic()

# ok: anthropic-hardcoded-api-key-python
client = Anthropic(api_key="not-a-real-key")
