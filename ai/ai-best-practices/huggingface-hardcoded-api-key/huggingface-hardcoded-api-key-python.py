import os
from huggingface_hub import InferenceClient, AsyncInferenceClient
from transformers import AutoModel

# ruleid: huggingface-hardcoded-api-key-python
client = InferenceClient(token="hf_abcdefghijklmnopqrstuvwxyz1234")

# ruleid: huggingface-hardcoded-api-key-python
client = InferenceClient(api_key="hf_abcdefghijklmnopqrstuvwxyz1234")

# ruleid: huggingface-hardcoded-api-key-python
client = AsyncInferenceClient(token="hf_abcdefghijklmnopqrstuvwxyz1234")

# ruleid: huggingface-hardcoded-api-key-python
client = AsyncInferenceClient(api_key="hf_abcdefghijklmnopqrstuvwxyz1234")

# ruleid: huggingface-hardcoded-api-key-python
model = AutoModel.from_pretrained("private/model", token="hf_abcdefghijklmnopqrstuvwxyz1234")

# ok: huggingface-hardcoded-api-key-python
client = InferenceClient(token=os.environ["HF_TOKEN"])

# ok: huggingface-hardcoded-api-key-python
client = InferenceClient(api_key=os.environ.get("HF_API_KEY"))

# ok: huggingface-hardcoded-api-key-python
client = InferenceClient()

# ok: huggingface-hardcoded-api-key-python
model = AutoModel.from_pretrained("public/model")
