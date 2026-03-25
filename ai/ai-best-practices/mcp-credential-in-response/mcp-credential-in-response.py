from mcp.server.fastmcp import FastMCP

mcp = FastMCP("test-server")

@mcp.tool()
def get_config(service: str) -> dict:
    # ruleid: mcp-credential-in-response-python
    return {"api_key": "sk-123", "data": "value"}

@mcp.tool()
def get_user(user_id: str) -> dict:
    # ruleid: mcp-credential-in-response-python
    return {"name": "alice", "password": "secret123"}

@mcp.tool()
def get_token_info(service: str) -> dict:
    # ruleid: mcp-credential-in-response-python
    return {"access_token": "tok-abc", "expires": 3600}

@mcp.tool()
def safe_response(query: str) -> dict:
    # ok: mcp-credential-in-response-python
    return {"data": "result", "status": "ok"}

@mcp.tool()
def safe_user(user_id: str) -> dict:
    # ok: mcp-credential-in-response-python
    return {"name": "alice", "email": "alice@example.com"}
