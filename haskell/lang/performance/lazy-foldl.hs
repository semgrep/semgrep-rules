module LazyFoldl where

import           Data.List (foldl')

# ruleid: haskell_lang_lazy_foldl
sum' = foldl (+) 0 xs

# ruleid: haskell_lang_lazy_foldl
total = foldl (\acc row -> acc + amount row) 0 rows

# ok: haskell_lang_lazy_foldl
sum'' = foldl' (+) 0 xs

# ok: haskell_lang_lazy_foldl
total' = foldr (+) 0 xs

# ok: haskell_lang_lazy_foldl
-- foldl in a comment is not code

# ok: haskell_lang_lazy_foldl
foldleft = id
