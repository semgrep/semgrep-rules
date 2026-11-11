import requests
import urllib3
import http.client
import websockets
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
def fetch_urllib3(url: str) -> str:
    http = urllib3.PoolManager()
    # ruleid: mcp-ssrf-python
    response = http.request("GET", url)
    return response.data.decode()

@mcp.tool()
def fetch_urllib3_request(url: str) -> str:
    # ruleid: mcp-ssrf-python
    response = urllib3.request("GET", url)
    return response.data.decode()

@mcp.tool()
def fetch_http_client(url: str) -> str:
    conn = http.client.HTTPSConnection("example.com")
    # ruleid: mcp-ssrf-python
    conn.request("GET", url)
    return conn.getresponse().read().decode()

@mcp.tool()
def fetch_http_client_post(url: str, data: str) -> str:
    conn = http.client.HTTPConnection("example.com")
    # ruleid: mcp-ssrf-python
    conn.request("POST", url, body=data)
    return conn.getresponse().read().decode()

@mcp.tool()
async def fetch_websockets(url: str) -> str:
    # ruleid: mcp-ssrf-python
    async with websockets.connect(url) as ws:
        await ws.send("hi")
        return await ws.recv()

@mcp.tool()
def safe_urllib3(url: str) -> str:
    parsed = urllib.parse.urlparse(url)
    http = urllib3.PoolManager()
    # ok: mcp-ssrf-python
    response = http.request("GET", parsed.geturl())
    return response.data.decode()

@mcp.tool()
async def hardcoded_websockets() -> str:
    # ok: mcp-ssrf-python
    async with websockets.connect("wss://example.com/socket") as ws:
        return await ws.recv()
