module UncheckedUnsafeOperation where

# ruleid: haskell_lang_unchecked_unsafe_operation
b = BU.unsafeIndex bytes i

# ruleid: haskell_lang_unchecked_unsafe_operation
v <- V.unsafeFreeze mv

# ruleid: haskell_lang_unchecked_unsafe_operation
x <- MV.unsafeRead mv i

# ok: haskell_lang_unchecked_unsafe_operation
b = BS.index bytes i

# ok: haskell_lang_unchecked_unsafe_operation
v <- V.freeze mv
