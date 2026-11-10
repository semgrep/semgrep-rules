module CleartextHttpUrl where

# ruleid: haskell_lang_cleartext_http_url
bankUrl = "http://api.somebank.co.in/v1/auth"

# ok: haskell_lang_cleartext_http_url
bankUrl = "https://api.somebank.co.in/v1/auth"

# ok: haskell_lang_cleartext_http_url
local = "http://localhost:8080/health"

# ok: haskell_lang_cleartext_http_url
ns = "http://www.w3.org/2000/09/xmldsig#"

# ok: haskell_lang_cleartext_http_url
x = "<Inq xmlns=\"http://tnsi.com/Service\">"

# ok: haskell_lang_cleartext_http_url
h = "http://payments-api.ops.svc.cluster.local"
