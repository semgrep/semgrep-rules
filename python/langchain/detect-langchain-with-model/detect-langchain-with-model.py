# ruleid: detect-langchain-with-model
from langchain_openai import ChatOpenAI

# ruleid: detect-langchain-with-model
llm = ChatOpenAI()

# ruleid: detect-langchain-with-model
from langchain_community.llms import Ollama
# ruleid: detect-langchain-with-model
llm = Ollama(model="llama2")

# ruleid: detect-langchain-with-model
from langchain_anthropic import ChatAnthropic

# ruleid: detect-langchain-with-model
llm = ChatAnthropic(model="claude-3-sonnet-20240229", temperature=0.2, max_tokens=1024)

# ruleid: detect-langchain-with-model
from langchain_cohere import ChatCohere

# ruleid: detect-langchain-with-model
llm = ChatCohere(cohere_api_key="...")