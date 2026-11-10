module UnsafeFunction where

import           Unsafe.Coerce (unsafeCoerce)

# ruleid: haskell_lang_unsafe_function
getErrTag _ = undefined

# ruleid: haskell_lang_unsafe_function
slot = unsafeCoerce @_ @Word16 key

# ruleid: haskell_lang_unsafe_function
len = unsafeDupablePerformIO measure

# ok: haskell_lang_unsafe_function
boom = error "not implemented"

# ok: haskell_lang_unsafe_function
safe = maybe (Left "missing") Right m

# ok: haskell_lang_unsafe_function
-- undefined / unsafeCoerce in a comment is not code

# ok: haskell_lang_unsafe_function
import           Universum as X hiding (head,
                                 undefined, unsafeCoerce)

# ruleid: haskell_lang_unsafe_function
c1 = Unsafe.Coerce.unsafeCoerce x

c3 = case x of
  _ ->
# ruleid: haskell_lang_unsafe_function
    undefined
