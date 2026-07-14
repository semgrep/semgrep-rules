import os
from mistralai import Mistral

# ruleid: mistral-hardcoded-api-key-python
client = Mistral(api_key="mySecretKey123456")

# ruleid: mistral-hardcoded-api-key-python
client = MistralClient(api_key="mySecretKey123456")

# ok: mistral-hardcoded-api-key-python
client = Mistral(api_key=os.environ["MISTRAL_API_KEY"])

# ok: mistral-hardcoded-api-key-python
client = Mistral(api_key=get_secret("mistral"))

# ok: mistral-hardcoded-api-key-python
client = Mistral()
