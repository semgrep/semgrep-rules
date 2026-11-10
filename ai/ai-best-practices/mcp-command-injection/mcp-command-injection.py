import asyncio
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

@mcp.tool(description="Ping a host")
def decorator_with_description(host: str) -> str:
    # ruleid: mcp-command-injection-python
    os.system("ping " + host)
    return "done"

@mcp.tool(name="ping")
def decorator_with_name(host: str) -> str:
    # ruleid: mcp-command-injection-python
    os.system("ping " + host)
    return "done"

@mcp.tool()
def run_popen(host: str) -> str:
    # ruleid: mcp-command-injection-python
    return os.popen("ping " + host).read()

@mcp.tool()
def run_check_output(host: str) -> bytes:
    # ruleid: mcp-command-injection-python
    return subprocess.check_output("ping " + host, shell=True)

@mcp.tool()
def run_check_call(host: str) -> int:
    # ruleid: mcp-command-injection-python
    return subprocess.check_call("ping " + host, shell=True)

@mcp.tool()
def run_getoutput(host: str) -> str:
    # ruleid: mcp-command-injection-python
    return subprocess.getoutput("ping " + host)

@mcp.tool()
async def run_asyncio_shell(host: str) -> None:
    # ruleid: mcp-command-injection-python
    await asyncio.create_subprocess_shell("ping " + host)

@mcp.tool()
def safe_check_output_list(host: str) -> bytes:
    # ok: mcp-command-injection-python
    return subprocess.check_output(["ping", host])

@mcp.tool()
def safe_check_output_quoted(host: str) -> bytes:
    # ok: mcp-command-injection-python
    return subprocess.check_output("ping " + shlex.quote(host), shell=True)

@mcp.resource("hosts://{host}")
def not_a_tool(host: str) -> str:
    # ok: mcp-command-injection-python
    os.system("ping " + host)
    return "done"
