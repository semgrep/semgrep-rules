module JwtUnverifiedDecode where

# ruleid: haskell_lang_jwt_unverified_decode
mJwt = JWT.decode tokenText

# ruleid: haskell_lang_jwt_unverified_decode
sub = unverifiedClaims jwt

# ok: haskell_lang_jwt_unverified_decode
mJwt = JWT.decodeAndVerifySignature signer tokenText

# ok: haskell_lang_jwt_unverified_decode
body <- decode raw
