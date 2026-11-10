module XssPreEscaped where

# ruleid: haskell_lang_xss_pre_escaped
H.div (preEscapedToHtml merchantNote)

# ruleid: haskell_lang_xss_pre_escaped
p_ (toHtmlRaw description)

# ruleid: haskell_lang_xss_pre_escaped
body = unsafeByteString rendered

# ok: haskell_lang_xss_pre_escaped
H.div (toHtml merchantNote)

# ok: haskell_lang_xss_pre_escaped
p_ (toHtml description)
