# cf. https://github.com/PyCQA/bandit/blob/b78c938c0bd03d201932570f5e054261e10c5750/examples/crypto-md5.py

import hashlib


# ruleid:insecure-hash-algorithm-sha1
hashlib.sha256(1)

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


def preserve_file_digest_inputs(sha1_file):
    from hashlib import sha1

    # ruleid:insecure-hash-algorithm-sha1
    hashlib.file_digest(sha1_file, "sha1")
    # ruleid:insecure-hash-algorithm-sha1
    hashlib.file_digest(sha1_file, hashlib.sha1)
    # ruleid:insecure-hash-algorithm-sha1
    hashlib.file_digest(sha1_file, sha1)
    # ok:insecure-hash-algorithm-sha1
    hashlib.file_digest(sha1_file, "sha256")


def fix_only_the_direct_constructor(sha1_file):
    import hashlib as hashes

    # ruleid:insecure-hash-algorithm-sha1
    hashlib.sha256(b"sha1")
    # ruleid:insecure-hash-algorithm-sha1
    hashlib.sha256(sha1_file.read())
    # ruleid:insecure-hash-algorithm-sha1
    hashes.sha256(b"sha1")
