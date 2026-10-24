import requests
import httpx
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

@mcp.tool()
def fetch_httpx(url: str) -> str:
    # ruleid: mcp-ssrf-python
    response = httpx.get(url)
    return response.text

@mcp.tool()
def post_httpx(url: str, data: str) -> str:
    # ruleid: mcp-ssrf-python
    response = httpx.post(url, data=data)
    return response.text

@mcp.tool()
def patch_requests(url: str, data: str) -> str:
    # ruleid: mcp-ssrf-python
    response = requests.patch(url, data=data)
    return response.text

@mcp.tool()
def head_requests(url: str) -> str:
    # ruleid: mcp-ssrf-python
    response = requests.head(url)
    return str(response.status_code)

@mcp.tool()
def options_requests(url: str) -> str:
    # ruleid: mcp-ssrf-python
    response = requests.options(url)
    return str(response.status_code)

@mcp.tool()
def generic_request(url: str) -> str:
    # ruleid: mcp-ssrf-python
    response = requests.request("GET", url)
    return response.text

@mcp.tool()
def httpx_request(url: str) -> str:
    # ruleid: mcp-ssrf-python
    response = httpx.request("DELETE", url)
    return response.text

@mcp.tool()
def httpx_stream(url: str) -> str:
    # ruleid: mcp-ssrf-python
    with httpx.stream("GET", url) as response:
        return str(response.status_code)

@mcp.tool()
def hardcoded_httpx() -> str:
    # ok: mcp-ssrf-python
    response = httpx.get("https://api.example.com/data")
    return response.text

@mcp.tool()
def hardcoded_request() -> str:
    # ok: mcp-ssrf-python
    response = requests.request("GET", "https://api.example.com/data")
    return response.text
