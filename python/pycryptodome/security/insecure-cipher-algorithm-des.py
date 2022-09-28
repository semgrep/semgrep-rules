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



key = b'-8B key-'
plaintext = b'We are no longer the knights who say ni!'
nonce = Random.new().read(pycrypto_des.block_size/2)
ctr = Counter.new(pycrypto_des.block_size*8/2, prefix=nonce)
# ruleid:insecure-cipher-algorithm-des
cipher = pycrypto_des.new(key, pycrypto_des.MODE_CTR, counter=ctr)
msg = nonce + cipher.encrypt(plaintext)
nonce = Random.new().read(pycryptodomex_des.block_size/2)
ctr = Counter.new(pycryptodomex_des.block_size*8/2, prefix=nonce)
# ruleid:insecure-cipher-algorithm-des
cipher = pycryptodomex_des.new(key, pycryptodomex_des.MODE_CTR, counter=ctr)
msg = nonce + cipher.encrypt(plaintext)


key = b'Sixteen byte key'
# ok:insecure-cipher-algorithm-des
cipher = AES.new(key, AES.MODE_EAX, nonce=nonce)
plaintext = cipher.decrypt(ciphertext)
try:
    cipher.verify(tag)
    print("The message is authentic:", plaintext)
except ValueError:
    print("Key incorrect or message corrupted")
