import urllib3 as ur3
import requests as req
import ssl as sss

import socket
import ssl

# from https://docs.python.org/3/library/ssl.html
hostname = 'www.python.org'
context = sss.create_default_context()

with socket.create_connection((hostname, 443)) as sock:
    # ok
    with context.wrap_socket(sock, server_hostname=hostname) as ssock:
        print(ssock.version())

with socket.create_connection((hostname, 443)) as sock:
    # ruleid:disabled-cert-validation
    with context.wrap_socket(sock, server_hostname=hostname, cert_reqs = ssl.CERT_NONE) as ssock:
        print(ssock.version())

with socket.create_connection((hostname, 443)) as sock:
    # won't work because of how we are using python to filter
    # todoruleid:disabled-cert-validation
    with context.wrap_socket(sock, server_hostname=hostname, cert_reqs = sss.CERT_NONE) as ssock:
        print(ssock.version())

from urllib3 import PoolManager
manager = PoolManager(10)
r = manager.request('GET', 'http://google.com/')

# ruleid:disabled-cert-validation
manager = PoolManager(10, cert_reqs = ssl.CERT_OPTIONAL)

# ruleid:disabled-cert-validation
proxy = ur3.ProxyManager('http://localhost:3128/', cert_reqs = ssl.CERT_NONE)

# ruleid:disabled-cert-validation
pool = ur3.connectionpool.HTTPSConnectionPool(cert_reqs=ssl.CERT_OPTIONAL)

# ruleid:http-not-https-connection
pool2 = ur3.connectionpool.HTTPConnectionPool(bla)

# ruleid:disabled-cert-validation
pool = ur3.connection_from_url('someurl', cert_reqs= ssl.CERT_NONE)

# ruleid:disabled-cert-validation
pool = ur3.connection_from_url('someurl', cert_reqs='NONE')

# OK; invalid
pool = ur3.connection_from_url('someurl', cert_reqs='CERT NONE')

# ruleid:disabled-cert-validation
pool = ur3.connection_from_url('someurl', cert_reqs="NONE")

# ok
pool = ur3.connection_from_url('someurl', cert_reqs= 'CERT_REQUIRED')


# ruleid:disabled-cert-validation
pool = ur3.proxy_from_url('someurl', cert_reqs= ssl.CERT_NONE)
# ok
pool = ur3.proxy_from_url('someurl', cert_reqs= ssl.CERT_REQUIED)
# ok
pool = ur3.proxy_from_url('someurl', cert_reqs=None)

r = req.get(some_url, stream=True)
import requests
r = requests.post(some_url, stream=True)

# ruleid:disabled-cert-validation-requests
r = req.get(some_url, stream=True, verify=False)
import requests
# ruleid:disabled-cert-validation-requests
r = requests.post(some_url, stream=True, verify=False)
