let username = someField.text()
let password = a.text()

let sql = "SELECT * FROM semgrep_users WHERE username = '\(username)' AND password = '\(password)'"

// ruleid:swift-potential-sqlite-injection
let result = sqlite3_exec(db, sql, nil, nil, nil)
sqlite3_close(db)

let sql = "SELECT * FROM semgrep_users WHERE username = 'admin' AND password = '\(password)'"
// ruleid:swift-potential-sqlite-injection
let result = sqlite3_exec(db, sql, nil, nil, nil)
sqlite3_close(db)


let sql = "SELECT * FROM semgrep_users WHERE username = ? AND password = ?"
var stmt: OpaquePointer?
// okid:swift-potential-sqlite-injection
if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK {
    sqlite3_bind_text(stmt, 1, username, -1, nil)
    sqlite3_bind_text(stmt, 2, password, -1, nil)
    if sqlite3_step(stmt) == SQLITE_DONE {
        // SUCCESS
    }
}

sqlite3_finalize(stmt)
sqlite3_close(db)

let sql = "SELECT * FROM semgrep_users WHERE username = 'admin' AND password = 'admin'"
// okid:swift-potential-sqlite-injection
let result = sqlite3_exec(db, sql, nil, nil, nil)
sqlite3_close(db)


let theUsername = "admin"
let sql = "SELECT * FROM semgrep_users WHERE username = '" + theUsername + "' AND password = 'admin'"
// FP but cant do much about this I dont think
// ruleid:swift-potential-sqlite-injection
let result = sqlite3_exec(db, sql, nil, nil, nil)
sqlite3_close(db)

let newUser = getUsernameFromServer()
let sql = "SELECT * FROM semgrep_users WHERE username = '" + newUser + "' AND password = 'admin'"
// ruleid:swift-potential-sqlite-injection
let result = sqlite3_exec(db, sql, nil, nil, nil)
sqlite3_close(db)


let sql = "SELECT * FROM semgrep_users WHERE username = 'admin' AND password = '" + password + "'"
// ruleid:swift-potential-sqlite-injection
let result = sqlite3_exec(db, sql, nil, nil, nil)
sqlite3_close(db)


let sql = "SELECT * FROM semgrep_users WHERE username = ? AND password = '" + password + "'"
// ruleid:swift-potential-sqlite-injection
if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK {
    sqlite3_bind_text(stmt, 1, username, -1, nil)
    if sqlite3_step(stmt) == SQLITE_DONE {
        // SUCCESS
    }
}

sqlite3_finalize(stmt)
sqlite3_close(db)