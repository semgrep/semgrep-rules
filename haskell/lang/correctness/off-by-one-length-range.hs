module OffByOneLengthRange where

# ruleid: haskell_lang_off_by_one_length_range
forM_ [0 .. length xs] $ \i -> print (xs !! i)

# ruleid: haskell_lang_off_by_one_length_range
idx = [0..V.length v]

# ok: haskell_lang_off_by_one_length_range
forM_ [0 .. length xs - 1] $ \i -> print (xs !! i)

# ok: haskell_lang_off_by_one_length_range
forM_ (zip [0 ..] xs) print
