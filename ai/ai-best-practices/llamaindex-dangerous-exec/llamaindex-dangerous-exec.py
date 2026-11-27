from llama_index.tools.code_interpreter import CodeInterpreterToolSpec
from llama_index.core.agent.workflow import FunctionAgent

# ruleid: llamaindex-dangerous-exec-python
code_spec = CodeInterpreterToolSpec()
agent = FunctionAgent(
    tools=code_spec.to_tool_list(),
    llm=llm,
    system_prompt="You are an assistant that can execute Python to answer questions.",
)

from llama_index.tools.code_interpreter.base import CodeInterpreterToolSpec as CITS

# ruleid: llamaindex-dangerous-exec-python
other_spec = CITS()

# ok: llamaindex-dangerous-exec-python
from llama_index.core.tools import FunctionTool


def search_func(query: str) -> str:
    return f"Results for {query}"


# ok: llamaindex-dangerous-exec-python
search_tool = FunctionTool.from_defaults(fn=search_func)
