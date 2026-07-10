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

# ruleid: detect-ollama
client = Client(host="http://localhost:11434")
chat_response = client.chat(
    model="llama3.1",
    messages=[{"role": "user", "content": "Hello"}],
)

foo = SomeUnrelatedClient()
# ok: detect-ollama
foo.chat("hi")

openai_client = OpenAI(api_key="sk-...")
# ok: detect-ollama
completion = openai_client.chat(
    model="gpt-4o",
    messages=[{"role": "user", "content": "Hello"}],
)
