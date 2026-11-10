module PartialHead where

import           Data.Maybe (listToMaybe)

# ruleid: haskell_lang_partial_head
first' = head xs

# ruleid: haskell_lang_partial_head
name = head (words line)

# ok: haskell_lang_partial_head
safe = listToMaybe xs

# ok: haskell_lang_partial_head
total (x:_) = x
total [] = Nothing

# ok: haskell_lang_partial_head
-- head in a comment is not code

# ok: haskell_lang_partial_head
headerName = "Content-Type"

a2 =
# ruleid: haskell_lang_partial_head
  head
    xs

# ruleid: haskell_lang_partial_head
a3 = Data.List.head xs

# ruleid: haskell_lang_partial_head
a4 = x --> head xs

# ok: haskell_lang_partial_head
a5 = x -- head in a trailing comment

# ok: haskell_lang_partial_head
a6 = putStrLn "never call head here"

# ok: haskell_lang_partial_head
import Data.List
  ( head,
    tail,
  )

# ok: haskell_lang_partial_head
{- block comment
   head xs
-}

# ok: haskell_lang_partial_head
mpiBytes = put . NE.head $ mpi
