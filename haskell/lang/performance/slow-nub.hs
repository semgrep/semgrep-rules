module SlowNub where

import           Data.List (nub)

# ruleid: haskell_lang_slow_nub
distinctTypes = nub types

# ruleid: haskell_lang_slow_nub
unique = L.nub . filter noCerealInstance $ recTypes

# ok: haskell_lang_slow_nub
distinctFast = Set.toList (Set.fromList types)

# ok: haskell_lang_slow_nub
distinctOrd = nubOrd types

# ok: haskell_lang_slow_nub
-- nub in a comment is not code

# ok: haskell_lang_slow_nub
import           Universum as X hiding (head,
                                 nub)
