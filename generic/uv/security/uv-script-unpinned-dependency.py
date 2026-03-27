#!/usr/bin/env python3

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
# ok: uv-script-unpinned-dependency
#   "numpy==1.24.0",
# ok: uv-script-unpinned-dependency
#   "pandas==2.1.0",
# ]
# ///

import httpx

print(httpx.get("http://example.com"))

# ok: uv-script-unpinned-dependency
"httpx"
