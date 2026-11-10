module PartialListFunction where

import           Data.Maybe (listToMaybe)

# ruleid: haskell_lang_partial_list_function
xs' = tail xs

# ruleid: haskell_lang_partial_list_function
body = init input

# ruleid: haskell_lang_partial_list_function
end = last items

# ruleid: haskell_lang_partial_list_function
second = names !! 1

# ruleid: haskell_lang_partial_list_function
n = read s :: Int

# ok: haskell_lang_partial_list_function
xs'' = drop 1 xs

# ok: haskell_lang_partial_list_function
n' = fromMaybe 0 (readMaybe s)

# ok: haskell_lang_partial_list_function
-- tail / last / !! mentioned in a comment only

# ok: haskell_lang_partial_list_function
rest = NE.tail neXs
