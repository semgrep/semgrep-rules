from mcp.server.fastmcp import FastMCP

mcp = FastMCP("test-server")


# ruleid: mcp-typosquatted-tool-name-python
@mcp.tool()
def filesytem_read(path: str) -> str:
    """Read a file."""
    return ""


# ruleid: mcp-typosquatted-tool-name-python
@mcp.tool()
def githbu_search(query: str) -> str:
    """Search GitHub."""
    return ""


# ruleid: mcp-typosquatted-tool-name-python
@mcp.tool()
def databse_query(sql: str) -> str:
    """Run a DB query."""
    return ""


# ruleid: mcp-typosquatted-tool-name-python
@mcp.tool(name="filesytem-read")
def alias_one(path: str) -> str:
    """Aliased read."""
    return ""


# ruleid: mcp-typosquatted-tool-name-python
@mcp.tool(name="gtihub_pr")
def alias_two(repo: str) -> str:
    """Aliased GitHub PR."""
    return ""


# ok: mcp-typosquatted-tool-name-python
@mcp.tool()
def filesystem_read(path: str) -> str:
    """Canonical filesystem reader."""
    return ""


# ok: mcp-typosquatted-tool-name-python
@mcp.tool()
def github_search(query: str) -> str:
    """Canonical GitHub search."""
    return ""


# ok: mcp-typosquatted-tool-name-python
@mcp.tool()
def database_query(sql: str) -> str:
    """Canonical database query."""
    return ""


# ok: mcp-typosquatted-tool-name-python
@mcp.tool(name="filesystem-read")
def alias_clean(path: str) -> str:
    """Canonical aliased reader."""
    return ""
