module SqlInjection where

import           Data.String.QQ (s)

# ruleid: haskell_lang_sql_injection_unsafe_interpolate
q1 = unsafeSqlQuery ("SELECT * FROM users WHERE name = '" ++ name ++ "'")

# ruleid: haskell_lang_sql_injection_unsafe_interpolate
q2 = Q.sql "SELECT * FROM t WHERE id = ${userId}"

# ruleid: haskell_lang_sql_injection_unsafe_interpolate
q3 = RawSql ("SELECT " ++ cols ++ " FROM t")

# ok: haskell_lang_sql_injection_unsafe_interpolate
q4 = select $ filter_ (\u -> u ^. userName ==. val_ name) (all_ (table_ users))

# ok: haskell_lang_sql_injection_unsafe_interpolate
-- unsafeSqlQuery / Q.sql in a comment is not code

# ruleid: haskell_lang_sql_injection_unsafe_interpolate
q = E.unsafeSqlValue ("lower(" <> col <> ")")
