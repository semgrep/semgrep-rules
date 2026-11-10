module UnsafePerformIO where

import           System.IO.Unsafe (unsafePerformIO)

# ruleid: haskell_lang_unsafe_perform_io
cached = unsafePerformIO newIORef

# ruleid: haskell_lang_unsafe_perform_io
value = unsafePerformIO (readFile "config")

# ok: haskell_lang_unsafe_perform_io
pureThing = 42

# ok: haskell_lang_unsafe_perform_io
-- unsafePerformIO in a comment is not code

# ok: haskell_lang_unsafe_perform_io
-- unsafePerformIO mentioned in docs only
