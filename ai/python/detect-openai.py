OPENAI_API_KEY = "MY_API_KEY"
# ruleid: detect-openai
from openai import OpenAI
# ruleid: detect-openai
client = OpenAI(
    # Defaults to os.environ.get("OPENAI_API_KEY")
)
# ruleid: detect-openai
chat_completion = client.chat.completions.create(
    model="gpt-3.5-turbo",
    messages=[{"role": "user", "content": "Hello world"}]
)