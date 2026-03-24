from langchain.utilities import PythonREPL
repl = PythonREPL()
# ruleid: langchain-dangerous-exec-python
repl.run(user_code)

from langchain_experimental.utilities import PythonREPL
repl2 = PythonREPL()
# ruleid: langchain-dangerous-exec-python
repl2.run(generated_code)

# ok: langchain-dangerous-exec-python
from langchain.tools import Tool
tool = Tool(name="search", func=search_func, description="Search")
