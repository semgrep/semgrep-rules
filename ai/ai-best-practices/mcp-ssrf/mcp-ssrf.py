import requests
import urllib.parse
import urllib.request
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("test-server")

ALLOWED_HOSTS = {"api.example.com"}

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
def parsed_but_unchecked(url: str) -> str:
    # urlparse alone does not validate: geturl() round-trips the attacker URL
    parsed = urllib.parse.urlparse(url)
    # ruleid: mcp-ssrf-python
    response = requests.get(parsed.geturl())
    return response.text

@mcp.tool()
def allowlisted_fetch(url: str) -> str:
    parsed = urllib.parse.urlparse(url)
    if parsed.hostname in ALLOWED_HOSTS:
        # ok: mcp-ssrf-python
        response = requests.get(parsed.geturl())
        return response.text
    raise ValueError("host not allowlisted")

@mcp.tool()
def guard_raise_fetch(url: str) -> str:
    parsed = urllib.parse.urlparse(url)
    if parsed.hostname not in ALLOWED_HOSTS:
        raise ValueError("host not allowlisted")
    # ok: mcp-ssrf-python
    response = requests.get(parsed.geturl())
    return response.text

@mcp.tool()
def hardcoded_fetch() -> str:
    # ok: mcp-ssrf-python
    response = requests.get("https://api.example.com/data")
    return response.text
