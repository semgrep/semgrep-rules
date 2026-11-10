module SensitiveDataLogging where

# ruleid: haskell_lang_sensitive_data_logging
logInfo "card details" (show req.cvv)

# ruleid: haskell_lang_sensitive_data_logging
L.logErrorT "auth" $ "pw=" <> password

# ruleid: haskell_lang_sensitive_data_logging
logInfo "otp sent" $ show otp

# ruleid: haskell_lang_sensitive_data_logging
print cardNumber

# ok: haskell_lang_sensitive_data_logging
logInfo "sending otp to user" uid

# ok: haskell_lang_sensitive_data_logging
logInfo "card" (maskCard req.cardLast4)

# ok: haskell_lang_sensitive_data_logging
logDebug "japan pinned region" region

# ok: haskell_lang_sensitive_data_logging
L.logInfoT "cvv cached" (show $ isJust mbCvv)

# ok: haskell_lang_sensitive_data_logging
Nothing -> L.logInfoT "Card" "Not found" >> pure (originalPan, exp)

# ok: haskell_lang_sensitive_data_logging
logRespAndReturn "card_info" =<< checkBin pan metrics

# ok: haskell_lang_sensitive_data_logging
logSecretM :: Show a => Text -> a -> m ()
