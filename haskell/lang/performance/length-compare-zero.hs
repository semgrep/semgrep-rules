module LengthCompareZero where

# ruleid: haskell_lang_length_compare_zero
when (length xs == 0) $ throwError EmptyBatch

# ruleid: haskell_lang_length_compare_zero
hasItems = length (filter isPaid txns) > 0

# ruleid: haskell_lang_length_compare_zero
empty = T.length name < 1

# ok: haskell_lang_length_compare_zero
when (null xs) $ throwError EmptyBatch

# ok: haskell_lang_length_compare_zero
tooMany = length xs > 100
