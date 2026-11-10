module WeakHash where

# ruleid: haskell_lang_weak_hash
digest = hashWith MD5 payload

# ruleid: haskell_lang_weak_hash
h = hash body :: Digest SHA1

# ruleid: haskell_lang_weak_hash
legacy = MD5.hash body

# ruleid: haskell_lang_weak_hash
fp = md5 lazyBytes

# ok: haskell_lang_weak_hash
digest = hashWith SHA256 payload

# ok: haskell_lang_weak_hash
label = "SHA1"

# ok: haskell_lang_weak_hash
-- MD5 mentioned in a comment
