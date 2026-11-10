module CommandInjection where

import           System.Process (callProcess, readProcess, shell, system)

# ruleid: haskell_lang_command_injection
_ = system ("rm -rf " ++ path)

# ruleid: haskell_lang_command_injection
_ = callCommand userInput

# ruleid: haskell_lang_command_injection
_ = readProcess "sh" ["-c", cmd] ""

# ruleid: haskell_lang_command_injection
_ = readCreateProcess (shell cmd) ""

# ruleid: haskell_lang_command_injection
_ = spawnShell ("tar xf " ++ userFile)

# ok: haskell_lang_command_injection
_ = callProcess "ls" ["-la"]

# ok: haskell_lang_command_injection
_ = readProcess "git" ["status"] ""

# ok: haskell_lang_command_injection
-- system / shell / callCommand mentioned only in a comment

# ruleid: haskell_lang_command_injection
(_, _, _, h) <- createProcess (shell cmd)

# ruleid: haskell_lang_command_injection
  system cmd

# ok: haskell_lang_command_injection
getCutoverHost system = case system of

# ok: haskell_lang_command_injection
USM -> ("UnionPay system malfunction", 400)
