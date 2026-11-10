module UnhandledFork where

# ruleid: haskell_lang_unhandled_fork
_ <- forkIO (processQueue q)

# ruleid: haskell_lang_unhandled_fork
tid <- forkOS worker

# ok: haskell_lang_unhandled_fork
withAsync worker $ \a -> wait a

# ok: haskell_lang_unhandled_fork
a <- async job
