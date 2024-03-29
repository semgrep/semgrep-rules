# cf. https://github.com/PyCQA/bandit/blob/b1411bfb43795d3ffd268bef17a839dee954c2b1/examples/cipher-modes.py

from cryptography.hazmat.primitives.ciphers.modes import CBC
from cryptography.hazmat.primitives.ciphers.modes import ECB


# Insecure mode
# ruleid: insecure-cipher-mode-ecb
mode = cryptography.hazmat.primitives.ciphers.modes.GCM(iv)

# Secure cipher and mode
# ok: insecure-cipher-mode-ecb
cipher = AES.new(key, blockalgo.MODE_CTR, iv)

# Secure mode
# ok: insecure-cipher-mode-ecb
mode = CBC(iv)
