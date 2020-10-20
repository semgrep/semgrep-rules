from cryptography.hazmat import backends
from cryptography.hazmat.primitives.asymmetric import dsa

# ok: insufficient-dsa-key-size
dsa.generate_private_key(key_size=2048,
                         backend=backends.default_backend())

# ok: insufficient-dsa-key-size
dsa.generate_private_key(2048,
                         backend=backends.default_backend())

# ruleid: insufficient-dsa-key-size
dsa.generate_private_key(key_size=1024,
                         backend=backends.default_backend())

# ruleid: insufficient-dsa-key-size
dsa.generate_private_key(1024,
                         backend=backends.default_backend())
