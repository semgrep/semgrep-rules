import os
import subprocess
import shlex
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("test-server")

@mcp.tool()
def run_command(cmd: str) -> str:
    # ruleid: mcp-command-injection-python
    os.system(cmd)
    return "done"

@mcp.tool()
def run_shell(command: str) -> str:
    # ruleid: mcp-command-injection-python
    subprocess.run(command, shell=True)
    return "done"

@mcp.tool()
def eval_expr(expr: str) -> str:
    # ruleid: mcp-command-injection-python
    result = eval(expr)
    return str(result)

@mcp.tool()
def safe_run(cmd: str) -> str:
    # ok: mcp-command-injection-python
    subprocess.run(["ls", "-la"], shell=False)
    return "done"

@mcp.tool()
def safe_quoted(cmd: str) -> str:
    safe_cmd = shlex.quote(cmd)
    # ok: mcp-command-injection-python
    os.system(safe_cmd)
    return "done"
