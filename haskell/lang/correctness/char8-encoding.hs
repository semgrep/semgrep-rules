module Char8Encoding where

# ruleid: haskell_lang_char8_encoding
import qualified Data.ByteString.Char8 as B8

# ruleid: haskell_lang_char8_encoding
import qualified Data.ByteString.Char8 as BS8

# ruleid: haskell_lang_char8_encoding
text = Char8.unpack payload

# ruleid: haskell_lang_char8_encoding
firstByte = Char8.head raw

# ok: haskell_lang_char8_encoding
senderUtf8 = encodeUtf8 senderHost

# ok: haskell_lang_char8_encoding
-- Data.ByteString.Char8 in a comment is not code
