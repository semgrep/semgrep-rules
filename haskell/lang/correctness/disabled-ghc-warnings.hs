module DisabledGhcWarnings where

# ruleid: haskell_lang_disabled_ghc_warnings
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

# ruleid: haskell_lang_disabled_ghc_warnings
{-# OPTIONS_GHC -Wall -fno-warn-missing-fields #-}

# ruleid: haskell_lang_disabled_ghc_warnings
{-# OPTIONS_GHC -fdefer-type-errors #-}

# ok: haskell_lang_disabled_ghc_warnings
{-# OPTIONS_GHC -Wno-unused-imports #-}

# ok: haskell_lang_disabled_ghc_warnings
{-# OPTIONS_GHC -Wall -Werror #-}
