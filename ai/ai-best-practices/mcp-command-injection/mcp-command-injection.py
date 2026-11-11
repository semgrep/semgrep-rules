import os
import pty
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

@mcp.tool()
def run_execv(cmd: str) -> str:
    # ruleid: mcp-command-injection-python
    os.execv("/bin/sh", ["sh", "-c", cmd])
    return "done"

@mcp.tool()
def run_execve(cmd: str) -> str:
    # ruleid: mcp-command-injection-python
    os.execve("/bin/sh", ["sh", "-c", cmd], os.environ)
    return "done"

@mcp.tool()
def run_execl(cmd: str) -> str:
    # ruleid: mcp-command-injection-python
    os.execl("/bin/sh", "sh", "-c", cmd)
    return "done"

@mcp.tool()
def run_execvp(cmd: str) -> str:
    # ruleid: mcp-command-injection-python
    os.execvp("sh", ["sh", "-c", cmd])
    return "done"

@mcp.tool()
def run_execle(cmd: str) -> str:
    # ruleid: mcp-command-injection-python
    os.execle("/bin/sh", "sh", "-c", cmd, os.environ)
    return "done"

@mcp.tool()
def run_pty_spawn(cmd: str) -> str:
    # ruleid: mcp-command-injection-python
    pty.spawn(["sh", "-c", cmd])
    return "done"

@mcp.tool()
def quoted_execv(cmd: str) -> str:
    safe_cmd = shlex.quote(cmd)
    # ok: mcp-command-injection-python
    os.execv("/bin/sh", ["sh", "-c", safe_cmd])
    return "done"

@mcp.tool()
def quoted_pty_spawn(cmd: str) -> str:
    safe_cmd = shlex.quote(cmd)
    # ok: mcp-command-injection-python
    pty.spawn(["sh", "-c", safe_cmd])
    return "done"
