module InsecureTls where

import           Network.Connection (TLSSettings (TLSSettingsSimple))

# ruleid: haskell_lang_insecure_tls
settings = TLSSettingsSimple True [] []

# ruleid: haskell_lang_insecure_tls
mkSettings = mkManagerSettings (TLSSettingsSimple True Nothing Nothing) Nothing

# ruleid: haskell_lang_insecure_tls
params = defaultParamsClient { onServerCertificate = \_ _ _ _ -> pure [] }

# ok: haskell_lang_insecure_tls
secure = TLSSettingsSimple False [] []

# ok: haskell_lang_insecure_tls
good = mkManagerSettings (TLSSettings clientParams) Nothing

# ok: haskell_lang_insecure_tls
checked = defaultParamsClient { onServerCertificate = validate HashSHA256 defaultHooks defaultChecks }

# ok: haskell_lang_insecure_tls
-- TLSSettingsSimple True in a comment is not code

# ruleid: haskell_lang_insecure_tls
settings = TLSSettingsSimple { settingDisableCertificateValidation = True, settingDisableSession = False, settingUseServerName = True }

# ruleid: haskell_lang_insecure_tls
cache = ValidationCache (\_ _ _ -> return ValidationCachePass) (\_ _ _ -> return ())
