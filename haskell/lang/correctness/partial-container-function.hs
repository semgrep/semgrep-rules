module PartialContainerFunction where

# ruleid: haskell_lang_partial_container_function
fee = feeTable Map.! merchantId

# ruleid: haskell_lang_partial_container_function
oldest = Map.findMin pending

# ruleid: haskell_lang_partial_container_function
x = vec V.! i

# ruleid: haskell_lang_partial_container_function
ne = NE.fromList xs

# ruleid: haskell_lang_partial_container_function
x = genericIndex xs i

# ok: haskell_lang_partial_container_function
fee = Map.lookup merchantId feeTable

# ok: haskell_lang_partial_container_function
x = vec V.!? i

# ok: haskell_lang_partial_container_function
m = Map.fromList pairs

# ok: haskell_lang_partial_container_function
ne = NE.nonEmpty xs

# ok: haskell_lang_partial_container_function
ne = NE.fromList [sigMPI]

# ok: haskell_lang_partial_container_function
lo = NES.findMin set
