import requests
import httpx
import urllib.parse
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("test-server")


@mcp.tool()
def fetch_with_bearer(url: str, token: str) -> str:
    # ruleid: mcp-credential-destination-injection-python
    response = requests.get(url, headers={"Authorization": f"Bearer {token}"})
    return response.text


@mcp.tool()
def post_with_bearer(url: str, token: str) -> str:
    # ruleid: mcp-credential-destination-injection-python
    response = requests.post(url, headers={"Authorization": f"Bearer {token}"})
    return response.text


@mcp.tool()
def fetch_with_auth_tuple(url: str, api_key: str) -> str:
    # ruleid: mcp-credential-destination-injection-python
    response = requests.get(url, auth=(api_key, ""))
    return response.text


@mcp.tool()
def fetch_httpx_with_bearer(url: str, token: str) -> str:
    # ruleid: mcp-credential-destination-injection-python
    response = httpx.get(url, headers={"Authorization": f"Bearer {token}"})
    return response.text


@mcp.tool()
def fetch_no_credential(url: str) -> str:
    # ok: mcp-credential-destination-injection-python
    response = requests.get(url)
    return response.text


@mcp.tool()
def fetch_validated_destination(url: str, token: str) -> str:
    parsed = urllib.parse.urlparse(url)
    # ok: mcp-credential-destination-injection-python
    response = requests.get(parsed.geturl(), headers={"Authorization": f"Bearer {token}"})
    return response.text


@mcp.tool()
def fetch_hardcoded_destination(token: str) -> str:
    # ok: mcp-credential-destination-injection-python
    response = requests.get("https://api.example.com/data", headers={"Authorization": f"Bearer {token}"})
    return response.text
