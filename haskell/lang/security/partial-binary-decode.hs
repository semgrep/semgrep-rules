module PartialBinaryDecode where

# ruleid: haskell_lang_partial_binary_decode
msg = Binary.decode payload :: Message

# ruleid: haskell_lang_partial_binary_decode
st <- decodeFile path

# ruleid: haskell_lang_partial_binary_decode
v = deserialise bytes

# ok: haskell_lang_partial_binary_decode
res = Binary.decodeOrFail payload

# ok: haskell_lang_partial_binary_decode
v = deserialiseOrFail bytes

# ok: haskell_lang_partial_binary_decode
raw = B64.decode encoded

# ok: haskell_lang_partial_binary_decode
v = maybe Nothing (rightToMaybe . Binary.decode) cached
