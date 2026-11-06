import requests
import aiohttp
import aiohttp as ah
from aiohttp import ClientSession as HTTPClient
from aiohttp import request as send_request
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
async def aiohttp_session_methods(url: str) -> str:
    async with aiohttp.ClientSession() as session:
        # ruleid: mcp-ssrf-python
        await session.get(url)
        # ruleid: mcp-ssrf-python
        await session.post(url)
        # ruleid: mcp-ssrf-python
        await session.put(url)
        # ruleid: mcp-ssrf-python
        await session.patch(url)
        # ruleid: mcp-ssrf-python
        await session.delete(url)
        # ruleid: mcp-ssrf-python
        await session.head(url)
        # ruleid: mcp-ssrf-python
        await session.options(url)
        # ruleid: mcp-ssrf-python
        async with session.get(url=url) as response:
            return await response.text()


@mcp.tool()
async def aiohttp_session_request(url: str) -> str:
    async with aiohttp.ClientSession() as session:
        # ruleid: mcp-ssrf-python
        await session.request("GET", url)
        # ruleid: mcp-ssrf-python
        await session.request("POST", url=url)
        # ruleid: mcp-ssrf-python
        async with session.request(method="GET", url=url) as response:
            return await response.text()


@mcp.tool()
async def aiohttp_module_request(url: str) -> str:
    # ruleid: mcp-ssrf-python
    async with aiohttp.request("GET", url) as response:
        await response.text()
    # ruleid: mcp-ssrf-python
    async with aiohttp.request("GET", url=url) as response:
        await response.text()
    # ruleid: mcp-ssrf-python
    async with aiohttp.request(method="GET", url=url) as response:
        return await response.text()


@mcp.tool()
async def aiohttp_import_alias(url: str) -> str:
    async with ah.ClientSession() as client:
        # ruleid: mcp-ssrf-python
        async with client.get(url) as response:
            return await response.text()


@mcp.tool()
async def aiohttp_request_aliases(url: str) -> str:
    # ruleid: mcp-ssrf-python
    async with ah.request("GET", url) as response:
        await response.text()
    # ruleid: mcp-ssrf-python
    async with send_request(method="GET", url=url) as response:
        return await response.text()


@mcp.tool()
async def aiohttp_constructor_alias(url: str) -> str:
    async with HTTPClient() as client:
        # ruleid: mcp-ssrf-python
        async with client.get(url) as response:
            return await response.text()


@mcp.tool()
async def aiohttp_url_propagation(url: str) -> str:
    destination = url
    async with aiohttp.ClientSession() as client:
        # ruleid: mcp-ssrf-python
        async with client.get(destination, timeout=aiohttp.ClientTimeout(total=5)) as response:
            return await response.text()


@mcp.tool()
async def aiohttp_constant_urls(data: str) -> str:
    async with aiohttp.ClientSession() as client:
        # ok: mcp-ssrf-python
        await client.get("https://example.com/")
        # ok: mcp-ssrf-python
        await client.post("https://example.com/", data=data)
        # ok: mcp-ssrf-python
        await client.post(url="https://example.com/", json={"value": data})
        # ok: mcp-ssrf-python
        await client.get("https://example.com/", headers={"X-Query": data})
        # ok: mcp-ssrf-python
        await client.request("POST", "https://example.com/", data=data)
        # ok: mcp-ssrf-python
        await client.request(data, "https://example.com/")
    # ok: mcp-ssrf-python
    async with aiohttp.request("POST", "https://example.com/", data=data) as response:
        return await response.text()


@mcp.tool()
async def aiohttp_constant_keyword_url(data: str) -> str:
    # ok: mcp-ssrf-python
    async with aiohttp.request(method=data, url="https://example.com/") as response:
        return await response.text()


class Cache:
    def get(self, key):
        return key

    def request(self, method, key):
        return key


@mcp.tool()
async def non_http_receivers(url: str) -> str:
    cache = Cache()
    # ok: mcp-ssrf-python
    cache.get(url)
    # ok: mcp-ssrf-python
    cache.request("GET", url)
    async with aiohttp.ClientSession() as client:
        # ok: mcp-ssrf-python
        cache.get(url)
        # ok: mcp-ssrf-python
        await client.get("https://example.com/", params={"q": url})
    return "ok"


@mcp.tool()
async def reassigned_session(url: str) -> str:
    client = aiohttp.ClientSession()
    await client.close()
    client = Cache()
    # ok: mcp-ssrf-python
    return client.get(url)


async def not_a_tool(url: str) -> str:
    async with aiohttp.ClientSession() as client:
        # ok: mcp-ssrf-python
        async with client.get(url) as response:
            return await response.text()
