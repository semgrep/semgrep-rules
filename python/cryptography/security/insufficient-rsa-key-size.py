import os
from cryptography.hazmat import backends
from cryptography.hazmat.primitives.asymmetric import rsa

# ok: insufficient-rsa-key-size
rsa.generate_private_key(public_exponent=65537,
                         key_size=2048,
                         backend=backends.default_backend())

# ok: insufficient-rsa-key-size
rsa.generate_private_key(65537,
                         2048,
                         backends.default_backend())

# ok: insufficient-rsa-key-size
rsa.generate_private_key(public_exponent=65537,
                         key_size=os.getenv("KEY_SIZE"),
                         backend=backends.default_backend())

# ok: insufficient-rsa-key-size
rsa.generate_private_key(65537,
                         2048,
                         backends.default_backend())

# ruleid: insufficient-rsa-key-size
rsa.generate_private_key(public_exponent=65537,
                         key_size=1024,
                         backend=backends.default_backend())

# ruleid: insufficient-rsa-key-size
rsa.generate_private_key(65537,
                         1024,
                         backends.default_backend())
