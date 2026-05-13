import os
import cohere

# ruleid: cohere-hardcoded-api-key-python
client = cohere.Client(api_key="abcdef1234567890")

# ruleid: cohere-hardcoded-api-key-python
client = cohere.ClientV2(api_key="mySecretKey123")

# ok: cohere-hardcoded-api-key-python
client = cohere.Client(api_key=os.environ["COHERE_API_KEY"])

# ok: cohere-hardcoded-api-key-python
client = cohere.Client(api_key=get_secret("cohere"))

# ok: cohere-hardcoded-api-key-python
client = cohere.Client()
