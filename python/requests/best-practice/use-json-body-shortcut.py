import json
import requests

# ruleid:python.requests.best-practice.use-json-body-shortcut
requests.put("https://example.org", body=json.dumps({"hello": True}))

# ruleid:python.requests.best-practice.use-json-body-shortcut
requests.patch("https://example.org", body=json.dumps({"hello": True}), timeout=5)

# ok
requests.post("https://example.org", json={"hello": True})

# ok
requests.post("https://example.org", body="hello=1")