# cf. https://github.com/PyCQA/bandit/blob/master/examples/cipher-modes.py

from cryptography.hazmat.primitives.ciphers.modes import CBC
from cryptography.hazmat.primitives.ciphers.modes import ECB


# Insecure mode
# ruleid: insecure-cipher-mode-ecb
mode = ECB(iv)

# Secure cipher and mode
# ok
cipher = AES.new(key, blockalgo.MODE_CTR, iv)

# Secure mode
# ok
mode = CBC(iv)
