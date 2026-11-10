module PartialExtreme where

import           Data.Foldable (maximumBy)

# ruleid: haskell_lang_partial_extreme
big = maximum xs

# ruleid: haskell_lang_partial_extreme
small = minimum scores

# ruleid: haskell_lang_partial_extreme
biggest = maximumBy compare entries

# ok: haskell_lang_partial_extreme
bigSafe = foldr (\a b -> Just (maybe a (max a) b)) Nothing xs

# ok: haskell_lang_partial_extreme
import           Universum as X hiding (head,
                                 maximum, minimum)

# ok: haskell_lang_partial_extreme
-- maximum / minimum in a comment is not code

# ok: haskell_lang_partial_extreme
maxHeader = "X-Max-Retries"

# ruleid: haskell_lang_partial_extreme
d1 = L.maximum xs

# ok: haskell_lang_partial_extreme
d2 = NE.maximum neXs
