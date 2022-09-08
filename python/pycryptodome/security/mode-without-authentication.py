from Crypto.Random import get_random_bytes
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad
from base64 import b64encode
from Crypto.Hash import HMAC, SHA256


def example1():
  # AES CBC, no mac
  sensitive_data = b"ALIENS DO EXIST!!!!"
  key = get_random_bytes(16)
  # ruleid: crypto-mode-without-authentication
  cipher = AES.new(key, AES.MODE_CBC)
  ciphertext = cipher.encrypt(pad(sensitive_data, AES.block_size))


def example2():
  # AES CBC with HMAC

  key = get_random_bytes(16)
  # ok: crypto-mode-without-authentication
  cipher = AES.new(key, AES.MODE_CBC)
  iv = b64encode(cipher.iv).decode('utf-8')
  sensitive_data = b"ALIENS DO EXIST!!!!"
  encrypted_bytes = cipher.encrypt(pad("data_to_encrypt", AES.block_size))

  hmac = HMAC.new(get_random_bytes(16), digestmod=SHA256)
  hmac.update(encrypted_bytes)
  mac_bytes = hmac.digest()
