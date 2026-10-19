"""Test cases for langchain-python-repl rule."""

from langchain_experimental.utilities.python import PythonREPL
from langchain_experimental.tools.python.tool import PythonREPLTool, PythonAstREPLTool
from langchain_experimental.tools import PythonREPLTool as PythonREPLToolAlt
import langchain_experimental.tools.python.tool
import subprocess
import json


def build_unsafe_repl_agent(llm):
    # ruleid: langchain-python-repl
    repl = PythonREPL()
    tools = [repl]
    return tools


def build_unsafe_repl_tool(llm):
    # ruleid: langchain-python-repl
    tool = PythonREPLTool()
    return tool


def build_unsafe_ast_repl(llm, df):
    # ruleid: langchain-python-repl
    tool = PythonAstREPLTool(locals={"df": df})
    return tool


def build_unsafe_full_import(llm):
    # ruleid: langchain-python-repl
    tool = langchain_experimental.tools.python.tool.PythonREPLTool()
    return tool


def build_safe_subprocess_executor(code: str):
    """
    Safe alternative: send code to an isolated subprocess with a timeout.
    Real deployments should add seccomp/gVisor/Firecracker on top of this.
    """
    # ok: langchain-python-repl
    proc = subprocess.run(
        ["python3", "-c", code],
        capture_output=True,
        timeout=5,
        check=False,
    )
    return proc.stdout.decode("utf-8", errors="replace")


def build_safe_jupyter_kernel_call(code: str, kernel_url: str, token: str):
    """
    Safe alternative: hand code off to a dedicated code-execution
    service (ephemeral Jupyter kernel per session).
    """
    # ok: langchain-python-repl
    import requests
    resp = requests.post(
        f"{kernel_url}/execute",
        headers={"Authorization": f"Bearer {token}"},
        json={"code": code},
        timeout=10,
    )
    return resp.json()
