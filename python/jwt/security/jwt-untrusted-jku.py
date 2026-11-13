import urllib.request

import aiohttp
import httpx
import jwt
import requests
import requests as http_client
import urllib3
from jose import jws
from jose import jwt as jose_jwt
from jwt import PyJWKClient
from jwt.algorithms import RSAAlgorithm

TRUSTED_JWKS_URL = "https://issuer.example.com/.well-known/jwks.json"
ALLOWED_JKU = {"https://issuer.example.com/.well-known/jwks.json"}


def bad_requests_get(token):
    header = jwt.get_unverified_header(token)
    # ruleid: jwt-python-untrusted-jku
    jwks = requests.get(header["jku"], timeout=5).json()
    key = RSAAlgorithm.from_jwk(jwks["keys"][0])
    return jwt.decode(token, key=key, algorithms=["RS256"])


def bad_requests_request_keyword_url(token):
    header = jwt.get_unverified_header(token)
    jku = header.get("jku")
    url = jku.replace("https://", "http://")
    # ruleid: jwt-python-untrusted-jku
    jwks = requests.request(method="get", url=url, timeout=5).json()
    key = RSAAlgorithm.from_jwk(jwks["keys"][0])
    return jwt.decode(token, key=key, algorithms=["RS256"])


def bad_inline_header(token):
    # ruleid: jwt-python-untrusted-jku
    client = PyJWKClient(jwt.get_unverified_header(token)["jku"])
    signing_key = client.get_signing_key_from_jwt(token)
    return jwt.decode(token, signing_key.key, algorithms=["RS256"])


def bad_x5u_urlopen(token):
    header = jwt.get_unverified_header(token)
    x5u = header.get("x5u")
    # ruleid: jwt-python-untrusted-jku
    with urllib.request.urlopen(x5u) as response:
        return response.read()


def bad_python_jose_httpx(token):
    header = jose_jwt.get_unverified_header(token)
    # ruleid: jwt-python-untrusted-jku
    jwks = httpx.get(header["jku"]).json()
    return jose_jwt.decode(token, jwks, algorithms=["RS256"])


def bad_python_jose_jws_inline_x5u(token):
    # ruleid: jwt-python-untrusted-jku
    cert = requests.get(jws.get_unverified_header(token).get("x5u"), timeout=5).text
    return cert


def bad_import_alias(token):
    header = jwt.get_unverified_header(token)
    # ruleid: jwt-python-untrusted-jku
    return http_client.get(header["jku"], timeout=5).json()


def bad_requests_session(token):
    header = jwt.get_unverified_header(token)
    session = requests.Session()
    # ruleid: jwt-python-untrusted-jku
    return session.get(header["jku"], timeout=5).json()


def bad_requests_session_context_manager(token):
    jku = jwt.get_unverified_header(token)["jku"]
    with requests.Session() as session:
        # ruleid: jwt-python-untrusted-jku
        return session.request("GET", jku, timeout=5).json()


def bad_httpx_client(token):
    jku = jwt.get_unverified_header(token)["jku"]
    with httpx.Client() as client:
        # ruleid: jwt-python-untrusted-jku
        return client.get(url=jku).json()


async def bad_httpx_async_client(token):
    jku = jwt.get_unverified_header(token)["jku"]
    async with httpx.AsyncClient() as client:
        # ruleid: jwt-python-untrusted-jku
        response = await client.get(jku)
    return response.json()


async def bad_aiohttp_session(token):
    jku = jwt.get_unverified_header(token)["jku"]
    async with aiohttp.ClientSession() as session:
        # ruleid: jwt-python-untrusted-jku
        async with session.get(jku) as response:
            return await response.json()


def bad_urllib3_pool_manager(token):
    jku = jwt.get_unverified_header(token)["jku"]
    # ruleid: jwt-python-untrusted-jku
    return urllib3.PoolManager().request("GET", jku).json()


def bad_prefix_check_is_not_an_allowlist(token):
    jku = jwt.get_unverified_header(token)["jku"]
    # "https://issuer.example.com.attacker.io/jwks.json" passes this check
    if not jku.startswith("https://issuer.example.com"):
        raise ValueError("untrusted jku")
    # ruleid: jwt-python-untrusted-jku
    return requests.get(jku, timeout=5).json()


def ok_fixed_jwks_url(token):
    # ok: jwt-python-untrusted-jku
    client = PyJWKClient(TRUSTED_JWKS_URL)
    signing_key = client.get_signing_key_from_jwt(token)
    return jwt.decode(token, signing_key.key, algorithms=["RS256"])


def ok_kid_lookup_in_trusted_jwks(token):
    header = jwt.get_unverified_header(token)
    kid = header["kid"]
    # ok: jwt-python-untrusted-jku
    jwks = requests.get(TRUSTED_JWKS_URL, timeout=5).json()
    jwk = next(k for k in jwks["keys"] if k["kid"] == kid)
    key = RSAAlgorithm.from_jwk(jwk)
    return jwt.decode(token, key=key, algorithms=["RS256"])


def ok_session_with_trusted_url(token):
    header = jwt.get_unverified_header(token)
    with requests.Session() as session:
        # ok: jwt-python-untrusted-jku
        jwks = session.get(TRUSTED_JWKS_URL, {"hint": header["jku"]}, timeout=5).json()
    jwk = next(k for k in jwks["keys"] if k["kid"] == header["kid"])
    return jwt.decode(token, key=RSAAlgorithm.from_jwk(jwk), algorithms=["RS256"])


def ok_jku_checked_against_allowlist(token):
    header = jwt.get_unverified_header(token)
    jku = header["jku"]
    if jku not in ALLOWED_JKU:
        raise ValueError("untrusted jku")
    # ok: jwt-python-untrusted-jku
    jwks = requests.get(jku, timeout=5).json()
    key = RSAAlgorithm.from_jwk(jwks["keys"][0])
    return jwt.decode(token, key=key, algorithms=["RS256"])
