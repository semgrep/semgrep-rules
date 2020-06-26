from cryptography.hazmat import backends
from cryptography.hazmat.primitives.asymmetric import rsa

# ok
rsa.generate_private_key(public_exponent=65537,
                         key_size=2048,
                         backend=backends.default_backend())

# ruleid: insufficient-rsa-key-size
rsa.generate_private_key(public_exponent=65537,
                         key_size=1024,
                         backend=backends.default_backend())