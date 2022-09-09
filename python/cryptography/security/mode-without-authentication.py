import os
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import hashes, hmac


def example1():
  # Hazmat CBC without mac

  key = os.urandom(32)
  iv = os.urandom(16)
  # ruleid: crypto-mode-without-authentication
  cipher = Cipher(algorithms.AES(key), modes.CBC(iv))
  encryptor = cipher.encryptor()
  ct = encryptor.update(b"a secret message") + encryptor.finalize()


def example2():
  # Hazmat CBC with mac

  key = os.urandom(32)
  iv = os.urandom(16)
  # ok: crypto-mode-without-authentication
  cipher = Cipher(algorithms.AES(key), modes.CBC(iv))
  encryptor = cipher.encryptor()
  ct = encryptor.update(b"a secret message") + encryptor.finalize()

  h = hmac.HMAC(os.urandom(32), hashes.SHA256())
  h.update(ct)
  hmac = h.finalize()
