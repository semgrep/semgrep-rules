module HashmapSize where

# ruleid: haskell_lang_hashmap_size
n = HM.size cache

# ruleid: haskell_lang_hashmap_size
when (HashSet.size seen > limit) evict

# ok: haskell_lang_hashmap_size
n = Map.size cache

# ok: haskell_lang_hashmap_size
e = HM.null cache
