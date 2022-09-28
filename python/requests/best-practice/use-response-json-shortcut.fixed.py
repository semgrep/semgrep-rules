import json
import requests

r = requests.get("https://example.org")

# ok: python.requests.best-practice.use-response-json-shortcut
payload = r.json()

# ruleid: python.requests.best-practice.use-response-json-shortcut
payload = r.json()
