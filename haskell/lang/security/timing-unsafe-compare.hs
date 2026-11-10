module TimingUnsafeCompare where

# ruleid: haskell_lang_timing_unsafe_compare
valid = computedSignature == headerSignature

# ruleid: haskell_lang_timing_unsafe_compare
bad = expectedHmac /= providedMac

# ruleid: haskell_lang_timing_unsafe_compare
when (otp == storedOtp) grantAccess

# ok: haskell_lang_timing_unsafe_compare
valid = constEq computedSignature headerSignature

# ok: haskell_lang_timing_unsafe_compare
none = tokenCount == 0

# ok: haskell_lang_timing_unsafe_compare
missing = signatureHeader == Nothing

# ok: haskell_lang_timing_unsafe_compare
if newUsageCount == tokenMaxUsage then a else b

# ok: haskell_lang_timing_unsafe_compare
isSig = authModeType == SIGNATURE_AUTH
