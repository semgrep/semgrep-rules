module PartialFromJust where

import           Data.Maybe (fromJust)

# ruleid: haskell_lang_partial_from_just
mime = fromJust mMime

# ruleid: haskell_lang_partial_from_just
port = fromJust (lookup "PORT" env)

# ok: haskell_lang_partial_from_just
port' = fromMaybe 8080 (lookup "PORT" env)

# ok: haskell_lang_partial_from_just
describe Nothing = "none"
describe (Just x) = x

# ok: haskell_lang_partial_from_just
-- fromJust in a comment is not code

b2 =
# ruleid: haskell_lang_partial_from_just
  fromJust
    mv

# ok: haskell_lang_partial_from_just
import Data.Maybe
  ( fromJust
  , maybe
  )
