module ScientificUnboundedConversion where

# ruleid: haskell_lang_scientific_unbounded_conversion
paise = round (amt :: Scientific) * 100

# ruleid: haskell_lang_scientific_unbounded_conversion
toAmount sciValue = truncate sciValue

# ruleid: haskell_lang_scientific_unbounded_conversion
c = Sci.coefficient n

# ok: haskell_lang_scientific_unbounded_conversion
paise = toBoundedInteger (amt :: Scientific)

# ok: haskell_lang_scientific_unbounded_conversion
secs = round elapsed
