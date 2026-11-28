# cf. https://github.com/PyCQA/bandit/blob/b78c938c0bd03d201932570f5e054261e10c5750/examples/crypto-md5.py

import hashlib


# ruleid:insecure-hash-algorithm-sha1
hashlib.sha1(1)

# ok:insecure-hash-algorithm-sha1
hashlib.sha256(1)


def file_digests(fileobj):
    # ruleid:insecure-hash-algorithm-sha1
    hashlib.file_digest(fileobj, "sha1")
    # ruleid:insecure-hash-algorithm-sha1
    hashlib.file_digest(fileobj, hashlib.sha1)
    # ok:insecure-hash-algorithm-sha1
    hashlib.file_digest(fileobj, "sha256")
    # ok:insecure-hash-algorithm-sha1
    hashlib.file_digest(fileobj, hashlib.sha256)
