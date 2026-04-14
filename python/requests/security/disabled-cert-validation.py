
import requests as req
import requests

some_url = "https://example.com"

# ok:disabled-cert-validation
r = req.get(some_url, stream=True)
# ok:disabled-cert-validation
r = requests.post(some_url, stream=True)

# ruleid:disabled-cert-validation
r = req.get(some_url, stream=True, verify=False)
# ruleid:disabled-cert-validation
r = requests.post(some_url, stream=True, verify=False)
# ruleid:disabled-cert-validation
r = requests.post(some_url, verify=False, stream=True)

# ok:disabled-cert-validation
session = requests.Session()
# ok:disabled-cert-validation
r = session.post(some_url, stream=True)

session = requests.Session()
# ruleid:disabled-cert-validation
r = session.post(some_url, verify=False, json={"text": "hello"})

s = requests.Session()
# ruleid:disabled-cert-validation
r = s.get(some_url, verify=False)
