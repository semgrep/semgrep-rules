module FilepathJoinForUrl where

# ruleid: haskell_lang_filepath_join_for_url
callbackUrl = baseUrl </> "payments" </> T.unpack orderId

# ruleid: haskell_lang_filepath_join_for_url
u = "https://api.bank.com" </> "v1"

# ok: haskell_lang_filepath_join_for_url
cfgPath = configDir </> "app.yaml"
