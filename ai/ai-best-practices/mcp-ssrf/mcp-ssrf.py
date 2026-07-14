import requests
import urllib.parse
import urllib.request
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("test-server")

@mcp.tool()
def fetch_url(url: str) -> str:
    # ruleid: mcp-ssrf-python
    response = requests.get(url)
    return response.text

@mcp.tool()
def post_data(url: str, data: str) -> str:
    # ruleid: mcp-ssrf-python
    response = requests.post(url, data=data)
    return response.text

@mcp.tool()
def open_url(url: str) -> str:
    # ruleid: mcp-ssrf-python
    response = urllib.request.urlopen(url)
    return response.read().decode()

@mcp.tool()
def safe_fetch(url: str) -> str:
    parsed = urllib.parse.urlparse(url)
    # ok: mcp-ssrf-python
    response = requests.get(parsed.geturl())
    return response.text

@mcp.tool()
def hardcoded_fetch() -> str:
    # ok: mcp-ssrf-python
    response = requests.get("https://api.example.com/data")
    return response.text
