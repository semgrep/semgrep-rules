module LazyModifyIoref where

# ruleid: haskell_lang_lazy_modify_ioref
modifyIORef counter (+1)

# ruleid: haskell_lang_lazy_modify_ioref
atomicModifyIORef cache (\m -> (Map.insert k v m, ()))

# ok: haskell_lang_lazy_modify_ioref
modifyIORef' counter (+1)

# ok: haskell_lang_lazy_modify_ioref
atomicModifyIORef' cache (\m -> (Map.insert k v m, ()))
