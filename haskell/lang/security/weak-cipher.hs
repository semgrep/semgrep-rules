module WeakCipher where

# ruleid: haskell_lang_weak_cipher
ctx = cipherInit key :: CryptoFailable DES_EDE3

# ruleid: haskell_lang_weak_cipher
ct = ecbEncrypt ctx plaintext

# ruleid: haskell_lang_weak_cipher
(st, out) = RC4.combine st0 bytes

# ok: haskell_lang_weak_cipher
ct = ctrCombine ctx iv plaintext

# ok: haskell_lang_weak_cipher
aead = aeadInit AEAD_GCM (ctx :: AES256) iv
