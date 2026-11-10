module UnboundedRequestBody where

# ruleid: haskell_lang_unbounded_request_body
body <- strictRequestBody req

# ruleid: haskell_lang_unbounded_request_body
raw <- lazyRequestBody request

# ok: haskell_lang_unbounded_request_body
app = requestSizeLimitMiddleware limits baseApp

# ok: haskell_lang_unbounded_request_body
chunk <- getRequestBodyChunk req
