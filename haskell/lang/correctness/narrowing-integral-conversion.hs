module NarrowingIntegralConversion where

# ruleid: haskell_lang_narrowing_integral_conversion
len = fromIntegral (BS.length body) :: Word16

# ruleid: haskell_lang_narrowing_integral_conversion
n = fromIntegral @Int @Int32 amountPaise

# ruleid: haskell_lang_narrowing_integral_conversion
k = fromInteger big :: Natural

# ok: haskell_lang_narrowing_integral_conversion
len = fromIntegral (BS.length body) :: Int64

# ok: haskell_lang_narrowing_integral_conversion
len = toIntegralSized (BS.length body) :: Maybe Word16
