# ruleid: detect-ollama
import ollama

# ruleid: detect-ollama
response = ollama.chat(
    model="llama3.1",
    messages=[{"role": "user", "content": "Why is the sky blue?"}],
)

# ruleid: detect-ollama
stream = ollama.generate(model="llama3.1", prompt="Count to ten.")

# ruleid: detect-ollama
from ollama import Client

client = Client(host="http://localhost:11434")
# ruleid: detect-ollama
chat_response = client.chat(
    model="llama3.1",
    messages=[{"role": "user", "content": "Hello"}],
)
