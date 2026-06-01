# ruleid: detect-groq
from groq import Groq

# ruleid: detect-groq
client = Groq(
    api_key="MY_API_KEY",
)
chat_completion = client.chat.completions.create(
    messages=[{"role": "user", "content": "Explain the importance of fast LLMs"}],
    model="llama-3.3-70b-versatile",
)

# ruleid: detect-groq
from groq import AsyncGroq

# ruleid: detect-groq
async_client = AsyncGroq()
