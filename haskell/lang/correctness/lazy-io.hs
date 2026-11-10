module LazyIo where

# ruleid: haskell_lang_lazy_io
cfg <- readFile path

# ruleid: haskell_lang_lazy_io
body <- hGetContents h

# ruleid: haskell_lang_lazy_io
raw <- BL.readFile path

# ok: haskell_lang_lazy_io
cfg <- T.readFile path

# ok: haskell_lang_lazy_io
raw <- BS.readFile path
