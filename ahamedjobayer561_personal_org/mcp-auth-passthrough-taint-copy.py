import urllib.request
from typing import Annotated

import aiohttp
import httpx
import requests
from mcp.server import Server
from mcp.server.stdio import stdio_server
from pydantic import Field

# Create MCP server instance
app = Server("example-server")

# Vulnerable MCP tool implementations - Auth credential pass-through

@app.call_tool()
async def fetch_with_auth_header(
    url: Annotated[str, Field(description="URL to fetch")],
    authorization: Annotated[str, Field(description="Authorization header")]
) -> str:
    """Fetch URL with user's auth header - VULNERABLE"""
    # ruleid: mcp-auth-passthrough-taint
    response = requests.get(url, headers={"Authorization": authorization})
    return response.text

@app.call_tool()
async def fetch_with_bearer_token(
    url: str,
    token: str
) -> str:
    """Fetch URL with bearer token - VULNERABLE"""
    # ruleid: mcp-auth-passthrough-taint
    response = requests.get(url, headers={"Authorization": f"Bearer {token}"})
    return response.text

@app.call_tool()
async def fetch_with_api_key(
    url: str,
    api_key: str
) -> str:
    """Fetch URL with API key - VULNERABLE"""
    headers = {"X-API-Key": api_key}
    # ruleid: mcp-auth-passthrough-taint
    response = requests.get(url, headers=headers)
    return response.text

@app.call_tool()
async def post_with_auth(
    url: str,
    data: str,
    auth: str
) -> str:
    """POST with auth header - VULNERABLE"""
    # ruleid: mcp-auth-passthrough-taint
    response = requests.post(url, json={"data": data}, headers={"Authorization": auth})
    return response.text

@app.call_tool()
async def fetch_with_httpx_auth(
    url: str,
    bearer: str
) -> str:
    """Fetch using httpx with bearer - VULNERABLE"""
    # ruleid: mcp-auth-passthrough-taint
    response = httpx.get(url, headers={"Authorization": f"Bearer {bearer}"})
    return response.text

@app.call_tool()
async def fetch_with_aiohttp_auth(
    url: str,
    token: str
) -> str:
    """Fetch using aiohttp with token - VULNERABLE"""
    async with aiohttp.ClientSession() as session:
        # ruleid: mcp-auth-passthrough-taint
        async with session.get(url, headers={"Authorization": token}) as response:
            return await response.text()

@app.call_tool()
async def fetch_with_session_auth(
    url: str,
    authorization: str
) -> str:
    """Fetch using requests session - VULNERABLE"""
    session = requests.Session()
    # ruleid: mcp-auth-passthrough-taint
    response = session.get(url, headers={"Authorization": authorization})
    return response.text

@app.call_tool()
async def fetch_with_urllib_auth(
    url: str,
    auth: str
) -> str:
    """Fetch using urllib with auth - VULNERABLE"""
    # ruleid: mcp-auth-passthrough-taint
    req = urllib.request.Request(url, headers={"Authorization": auth})
    response = urllib.request.urlopen(req)
    return response.read().decode()

@app.call_tool()
async def fetch_with_add_header(
    url: str,
    token: str
) -> str:
    """Fetch using urllib add_header - VULNERABLE"""
    req = urllib.request.Request(url)
    # ruleid: mcp-auth-passthrough-taint
    req.add_header("Authorization", token)
    response = urllib.request.urlopen(req)
    return response.read().decode()

@app.call_tool()
async def fetch_with_dict_auth(
    url: str,
    auth_header: str
) -> str:
    """Fetch with auth from dict - VULNERABLE"""
    headers = {
        "Authorization": auth_header,
        "User-Agent": "MCP Tool"
    }
    # ruleid: mcp-auth-passthrough-taint
    response = requests.get(url, headers=headers)
    return response.text

# Safe MCP tool implementations

@app.call_tool()
async def fetch_with_validated_url(
    url: str,
    authorization: str
) -> str:
    """Fetch with URL validation before passing auth"""
    allowed_domains = ["https://api.example.com", "https://trusted.example.com"]
    if not any(url.startswith(domain) for domain in allowed_domains):
        raise ValueError("URL not in allowlist")

    # todook: mcp-auth-passthrough-taint
    response = requests.get(url, headers={"Authorization": authorization})
    return response.text

@app.call_tool()
async def fetch_with_hardcoded_url(authorization: str) -> str:
    """Fetch from hardcoded URL with auth"""
    # todook: mcp-auth-passthrough-taint
    response = requests.get(
        "https://api.example.com/data",
        headers={"Authorization": authorization}
    )
    return response.text

@app.call_tool()
async def fetch_without_auth(url: str) -> str:
    """Fetch without passing any auth credentials"""
    # ok: mcp-auth-passthrough-taint
    response = requests.get(url)
    return response.text

@app.call_tool()
async def fetch_with_service_auth(url: str) -> str:
    """Fetch with service's own auth, not user's"""
    import os
    service_token = os.environ.get("SERVICE_TOKEN")
    if not any(url.startswith(d) for d in ["https://api.example.com"]):
        raise ValueError("Invalid URL")

    # todook: mcp-auth-passthrough-taint
    response = requests.get(url, headers={"Authorization": f"Bearer {service_token}"})
    return response.text

@app.call_tool()
async def fetch_with_url_parse_validation(
    url: str,
    authorization: str
) -> str:
    """Fetch with URL hostname validation"""
    import urllib.parse
    parsed = urllib.parse.urlparse(url)

    if parsed.hostname not in ["api.example.com", "trusted.example.com"]:
        raise ValueError("Invalid hostname")

    # todook: mcp-auth-passthrough-taint
    response = requests.get(url, headers={"Authorization": authorization})
    return response.text

# Server setup
async def main():
    async with stdio_server() as (read_stream, write_stream):
        await app.run(
            read_stream,
            write_stream,
            app.create_initialization_options()
        )

if __name__ == "__main__":
    import asyncio
    asyncio.run(main())
