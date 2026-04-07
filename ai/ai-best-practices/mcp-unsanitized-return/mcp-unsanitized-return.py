import requests
import html
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("test-server")

@mcp.tool()
def fetch_page(url: str) -> str:
    response = requests.get(url)
    # ruleid: mcp-unsanitized-return-python
    return response.text

@mcp.tool()
def fetch_json(url: str) -> dict:
    response = requests.post(url)
    # ruleid: mcp-unsanitized-return-python
    return response.json()

@mcp.tool()
def safe_fetch(url: str) -> str:
    response = requests.get(url)
    clean = html.escape(response.text)
    # ok: mcp-unsanitized-return-python
    return clean

@mcp.tool()
def local_only() -> str:
    # ok: mcp-unsanitized-return-python
    return "hello world"
