import os
from cryptography.hazmat import backends
from cryptography.hazmat.primitives.asymmetric import rsa

rsa.generate_private_key(public_exponent=65537,
# ok: insufficient-rsa-key-size
                         key_size=2048,
                         backend=backends.default_backend())

rsa.generate_private_key(65537,
# ok: insufficient-rsa-key-size
                         2048,
                         backends.default_backend())

rsa.generate_private_key(public_exponent=65537,
# ok: insufficient-rsa-key-size
                         key_size=os.getenv("KEY_SIZE"),
                         backend=backends.default_backend())

rsa.generate_private_key(65537,
# ok: insufficient-rsa-key-size
                         2048,
                         backends.default_backend())

rsa.generate_private_key(public_exponent=65537,
# ruleid: insufficient-rsa-key-size
                         key_size=2048,
                         backend=backends.default_backend())

rsa.generate_private_key(65537,
# ruleid: insufficient-rsa-key-size
                         2048,
                         backends.default_backend())
