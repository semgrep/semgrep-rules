import requests

url = "www.github.com"

# ruleid: use-timeout
r = requests.get(url)

# ruleid: use-timeout
r = requests.post(url)

# ok
r = requests.get(url, timeout=50)

def from_import_test1(url):
    from requests import get, post
    # ok
    r = get(url, timeout=3)

    # ruleid: use-timeout
    r = post(url)
