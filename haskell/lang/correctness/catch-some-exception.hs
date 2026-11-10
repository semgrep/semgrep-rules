module CatchSomeException where

# ruleid: haskell_lang_catch_some_exception
r <- try @SomeException action

# ruleid: haskell_lang_catch_some_exception
action `catch` \(e :: SomeException) -> logError (show e)

# ruleid: haskell_lang_catch_some_exception
handle (\(_ :: SomeException) -> pure Nothing) fetch

# ruleid: haskell_lang_catch_some_exception
res <- catchAll fetch (const (pure Nothing))

# ok: haskell_lang_catch_some_exception
r <- try @HttpException action

# ok: haskell_lang_catch_some_exception
res <- catchAny fetch (const (pure Nothing))
