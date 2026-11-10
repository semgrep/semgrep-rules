module InsecureTlsVersion where

# ruleid: haskell_lang_insecure_tls_version
sup = def { supportedVersions = [TLS12, TLS11, TLS10] }

# ok: haskell_lang_insecure_tls_version
sup = def { supportedVersions = [TLS13, TLS12] }
