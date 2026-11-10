module HardcodedSecret where

# ruleid: haskell_lang_hardcoded_secret
dbPassword = "s3cr3t-pa55"

# ruleid: haskell_lang_hardcoded_secret
cfg = defaultCfg { apiKey = "sk_live_abcdef123" }

# ruleid: haskell_lang_hardcoded_secret
jwtSecret = T.pack "my-signing-secret"

# ok: haskell_lang_hardcoded_secret
dbPassword <- lookupEnv "DB_PASSWORD"

# ok: haskell_lang_hardcoded_secret
passwordMinLength = 12

# ok: haskell_lang_hardcoded_secret
authPasswordEnv = "PASSETTO_AUTH_PASSWORD"

# ok: haskell_lang_hardcoded_secret
apiKeyHeader = "x-api-key"

# ok: haskell_lang_hardcoded_secret
getAuthHeaderValue key secret = "Basic " <> encode (key <> ":" <> secret)

# ok: haskell_lang_hardcoded_secret
valid = password == ""

# ok: haskell_lang_hardcoded_secret
-- password = "hunter22"
