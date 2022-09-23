# cf. https://github.com/PyCQA/bandit/blob/b78c938c0bd03d201932570f5e054261e10c5750/examples/crypto-md5.py

from cryptography.hazmat.primitives import hashes

# ruleid:insecure-hash-algorithm-md5
hashes.MD5()
# ok:insecure-hash-algorithm-md5
hashes.SHA256()
# ok:insecure-hash-algorithm-md5
hashes.SHA3_256()
