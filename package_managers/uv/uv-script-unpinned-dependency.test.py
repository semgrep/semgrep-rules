#!/usr/bin/env python3
"""Test cases for uv-script-unpinned-dependency."""

# /// script
# requires-python = ">=3.12"
# dependencies = [
# ruleid: uv-script-unpinned-dependency
#   "httpx",
# ruleid: uv-script-unpinned-dependency
#   "requests>=2.0",
# ruleid: uv-script-unpinned-dependency
#   "flask~=2.0",
# ruleid: uv-script-unpinned-dependency
#   "rich",
# ruleid: uv-script-unpinned-dependency
#   "django>=4.0,<5.0",
# ruleid: uv-script-unpinned-dependency
#   "requests[security]",
# ruleid: uv-script-unpinned-dependency
#   "httpx!=0.27.0",
# ok: uv-script-unpinned-dependency
#   "numpy==1.24.0",
# ok: uv-script-unpinned-dependency
#   "pandas==2.1.0",
# ok: uv-script-unpinned-dependency
#   "requests[security]==2.31.0",
# ok: uv-script-unpinned-dependency
#   "flask @ git+https://github.com/pallets/flask.git",
# ok: uv-script-unpinned-dependency
#   "django @ git+ssh://[email protected]/django/django.git",
# ]
#
# [tool.ruff]
# A tool table inside script metadata must not be flagged because the
# dependency array is the only place dependency specifiers live.
# ok: uv-script-unpinned-dependency
# line-length = "100"
# ///

import httpx

# A bare quoted name outside the script metadata block must not be flagged.
# ok: uv-script-unpinned-dependency
"httpx"

# ok: uv-script-unpinned-dependency
x = "requests"

print(httpx.get("http://example.com"))
