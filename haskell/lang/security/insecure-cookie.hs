module InsecureCookie where

# ruleid: haskell_lang_insecure_cookie
c = defaultSetCookie { setCookieName = "sid", setCookieSecure = False }

# ruleid: haskell_lang_insecure_cookie
c' = c { setCookieHttpOnly = False }

# ruleid: haskell_lang_insecure_cookie
c'' = c { setCookieSameSite = Just sameSiteNone }

# ok: haskell_lang_insecure_cookie
c = defaultSetCookie { setCookieSecure = True, setCookieHttpOnly = True }
