module PartialFold1 where

import           Data.List (foldr1)

# ruleid: haskell_lang_partial_fold1
sum1 = foldl1 (+) xs

# ruleid: haskell_lang_partial_fold1
strictSum = foldl1' (+) xs

# ruleid: haskell_lang_partial_fold1
joinAll = foldr1 (\a b -> a <> b) parts

# ok: haskell_lang_partial_fold1
sumSeeded = foldl' (+) 0 xs

# ok: haskell_lang_partial_fold1
joinSeeded = foldr (<>) mempty parts

# ok: haskell_lang_partial_fold1
-- foldl1 / foldr1 in a comment is not code

# ok: haskell_lang_partial_fold1
import           Universum as X hiding (head,
                                 foldl1, trace)
