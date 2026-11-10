module DebugTrace where

import           Debug.Trace (trace, traceShow)

# ruleid: haskell_lang_debug_trace
v = trace "value" x

# ruleid: haskell_lang_debug_trace
v' = traceShow ("got", x) x

# ruleid: haskell_lang_debug_trace
v'' = Debug.Trace.traceStack "here" x

# ok: haskell_lang_debug_trace
pureValue = 42

# ok: haskell_lang_debug_trace
logIt = logInfo . mconcat ["value=", tshow x]

# ok: haskell_lang_debug_trace
-- trace / traceShow in a comment is not code
