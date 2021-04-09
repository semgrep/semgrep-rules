package main

import "database/sql"
import "fmt"

func setup() {
    db, err := sql.Open("mysql", "theUser:thePassword@/theDbName")
    if err != nil {
        panic(err)
    }
}

func bad1() {
    query = "SELECT name FROM users WHERE age=" + req.FormValue("age")
    // ruleid: gosql-sqli
    db.Query(query)
}

func bad2() {
    query = "SELECT name FROM users WHERE age="
    query += req.FormValue("age")
    // ruleid: gosql-sqli
    db.QueryRow(query)
}

func bad3() {
    query = fmt.Sprintf("SELECT * FROM users WHERE email='%s';", email)
    // ruleid: gosql-sqli
    db.Exec(query)
}

func bad4() {
    // ruleid: gosql-sqli
    db.Exec("SELECT name FROM users WHERE age=" + req.FormValue("age"))
}

func bad5() {
    // ruleid: gosql-sqli
    db.Exec(fmt.Sprintf("SELECT * FROM users WHERE email='%s';", email))
}

func ok1() {
    query = fmt.Sprintf("SELECT * FROM users WHERE email=hello;")
    // ok: gosql-sqli
    db.Exec(query)
}

func ok2() {
    query = "SELECT name FROM users WHERE age=" + "3"
    // ok: gosql-sqli
    db.Query(query)
}

func ok3() {
    query = "SELECT name FROM users WHERE age="
    query += "3"
    // ok: gosql-sqli
    db.Query(query)
}

func ok4() {
    // ok: gosql-sqli
    db.Exec("INSERT INTO users(name, email) VALUES($1, $2)",
  "Jon Calhoun", "jon@calhoun.io")
}

func ok5() {
    // ok: gosql-sqli
    db.Exec("SELECT name FROM users WHERE age=" + "3")
}

func ok6() {
    // ok: gosql-sqli
    db.Exec(fmt.Sprintf("SELECT * FROM users WHERE email=hello;"))
}
