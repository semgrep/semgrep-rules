module CorsAllowAll where

# ruleid: haskell_lang_cors_allow_all
app = simpleCors $ serve api server

# ruleid: haskell_lang_cors_allow_all
policy = simpleCorsResourcePolicy { corsOrigins = Nothing }

# ok: haskell_lang_cors_allow_all
policy = simpleCorsResourcePolicy { corsOrigins = Just (["https://a.example"], True) }
