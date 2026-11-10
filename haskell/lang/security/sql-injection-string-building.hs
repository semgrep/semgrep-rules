module SqlInjectionStringBuilding where

# ruleid: haskell_lang_sql_injection_string_building
rows <- query_ conn (fromString ("SELECT * FROM users WHERE id = " ++ uid))

# ruleid: haskell_lang_sql_injection_string_building
txns <- rawSql ("SELECT ?? FROM txn WHERE id = " <> tid) []

# ruleid: haskell_lang_sql_injection_string_building
execute_ conn (Query (encodeUtf8 sqlText))

# ok: haskell_lang_sql_injection_string_building
rows <- query conn "SELECT * FROM users WHERE id = ?" (Only uid)

# ok: haskell_lang_sql_injection_string_building
txns <- rawSql "SELECT ?? FROM txn WHERE id = ?" [toPersistValue tid]
