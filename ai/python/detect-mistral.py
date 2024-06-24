import os
# ruleid: detect-mistral
from mistralai.client import MistralClient
# ruleid: detect-mistral
from mistralai.models.chat_completion import ChatMessage

api_key = os.environ["MISTRAL_API_KEY"]
model = "mistral-large-latest"

# ruleid: detect-mistral
client = MistralClient(api_key=api_key)

# ruleid: detect-mistral
chat_response = client.chat(
    model=model,
    messages=[ChatMessage(role="user", content="What is the best French cheese?")]
)

print(chat_response.choices[0].message.content)