from langchain_experimental.agents import create_pandas_dataframe_agent
from langchain_community.vectorstores import FAISS
from langchain_community.utilities import RequestsWrapper

# ruleid: langchain-allow-dangerous-flags-python
agent = create_pandas_dataframe_agent(llm, df, allow_dangerous_code=True)

# ruleid: langchain-allow-dangerous-flags-python
store = FAISS.load_local(path, embeddings, allow_dangerous_deserialization=True)

# ruleid: langchain-allow-dangerous-flags-python
requests_wrapper = RequestsWrapper(allow_dangerous_requests=True)

# ruleid: langchain-allow-dangerous-flags-python
config = {"model": "gpt-4", "allow_dangerous_code": True}

# ok: langchain-allow-dangerous-flags-python
safe_agent = create_pandas_dataframe_agent(llm, df, allow_dangerous_code=False)

# ok: langchain-allow-dangerous-flags-python
safe_store = FAISS.load_local(path, embeddings)

# ok: langchain-allow-dangerous-flags-python
safe_config = {"model": "gpt-4", "allow_dangerous_code": False}
