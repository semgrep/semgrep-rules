module InsecureRandom where

# ruleid: haskell_lang_insecure_random
otp <- randomRIO (100000, 999999 :: Int)

# ruleid: haskell_lang_insecure_random
gen <- newStdGen

# ruleid: haskell_lang_insecure_random
let gen = mkStdGen 42

# ok: haskell_lang_insecure_random
bytes <- getRandomBytes 32

# ok: haskell_lang_insecure_random
seed <- getEntropy 16
