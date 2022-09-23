# cf. https://github.com/PyCQA/bandit/blob/b78c938c0bd03d201932570f5e054261e10c5750/examples/ciphers.py

from Crypto.Cipher import AES
from Crypto.Cipher import ARC2 as pycrypto_arc2
from Crypto.Cipher import ARC4 as pycrypto_arc4
from Crypto.Cipher import Blowfish as pycrypto_blowfish
from Crypto.Cipher import DES as pycrypto_des
from Crypto.Cipher import XOR as pycrypto_xor
from Cryptodome.Cipher import ARC2 as pycryptodomex_arc2
from Cryptodome.Cipher import ARC4 as pycryptodomex_arc4
from Cryptodome.Cipher import Blowfish as pycryptodomex_blowfish
from Cryptodome.Cipher import DES as pycryptodomex_des
from Cryptodome.Cipher import XOR as pycryptodomex_xor
from Crypto.Hash import SHA
from Crypto import Random
from Crypto.Util import Counter

key = b'Sixteen byte key'
iv = Random.new().read(pycrypto_arc2.block_size)
# ruleid:insecure-cipher-algorithm-rc2
cipher = pycrypto_arc2.new(key, pycrypto_arc2.MODE_CFB, iv)
msg = iv + cipher.encrypt(b'Attack at dawn')
# ruleid:insecure-cipher-algorithm-rc2
cipher = pycryptodomex_arc2.new(key, pycryptodomex_arc2.MODE_CFB, iv)
msg = iv + cipher.encrypt(b'Attack at dawn')

key = b'Sixteen byte key'
# ok:insecure-cipher-algorithm-rc2
cipher = AES.new(key, AES.MODE_EAX, nonce=nonce)
plaintext = cipher.decrypt(ciphertext)
try:
    cipher.verify(tag)
    print("The message is authentic:", plaintext)
except ValueError:
    print("Key incorrect or message corrupted")
