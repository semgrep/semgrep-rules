OPENAI_API_KEY = "MY_API_KEY"
# ruleid: detect-generic-ai-oai
from openai import OpenAI
# ruleid: detect-generic-ai-oai
client = OpenAI(
    # Defaults to os.environ.get("OPENAI_API_KEY")
)