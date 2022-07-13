import requests

url = "www.github.com"

# ruleid: use-timeout
r = requests.get(url)

# ruleid: use-timeout
r = requests.post(url)

# ok: use-timeout
r = requests.get(url, timeout=50)


def from_import_test1(url):
    from requests import get, post

    # ok: use-timeout
    r = get(url, timeout=3)

    # ruleid: use-timeout
    r = post(url)


def test2():
    """Perform a requests.get and default headers set"""
    headers = {**_get_default_headers(), **headers}
    # ok: use-timeout
    r = requests.get(
        url, headers=headers, params=params, **{"timeout": TIMEOUT, **kwargs}
    )
    return r


def test3():
    session = requests.Session()
    # ruleid: use-timeout
    r = session.get(get_url())

    # ok: use-timeout
    r = session.get(url, timeout=3)
