package main

import (
    "fmt"

    "github.com/go-pg/pg/v10"
    "github.com/go-pg/pg/v10/orm"
)

func bad1() {
    db := pg.Connect(&pg.Options{
        Addr:     ":5432",
        User:     "user",
        Password: "pass",
        Database: "db_name",
    })
    query = "SELECT name FROM users WHERE age=" + req.FormValue("age")
    // ruleid: pg-sqli
    rows, err := db.ExecContext(query)
}

func bad2() {
    opt, err := pg.ParseURL("postgres://user:pass@localhost:5432/db_name")
    if err != nil {
       panic(err)
    }

    db := pg.Connect(opt)

    query = "SELECT name FROM users WHERE age=" + req.FormValue("age")
    // ruleid: pg-sqli
    rows, err := db.Exec(ctx, query)
}

func bad3() {
    opt, err := pg.ParseURL("postgres://user:pass@localhost:5432/        db_name")
    if err != nil {
        panic(err)
    }

    db := pg.Connect(opt)
    query = "SELECT name FROM users WHERE age="
    query += req.FormValue("age")
    // ruleid: pg-sqli
    db.QueryContext(ctx, query)
}

func bad4(db *pg.DB) {
    query = fmt.Sprintf("SELECT * FROM users WHERE email='%s';", email)
    // ruleid: pg-sqli
    db.Query(ctx, query)
}

func bad5(db *pg.DB) {
    // ruleid: pg-sqli
    db.Exec(ctx, "SELECT name FROM users WHERE age=" + req.FormValue("age"))
}

func bad6(db *pg.DB) {
    // ruleid: pg-sqli
    db.QueryOne(ctx, fmt.Sprintf("SELECT * FROM users WHERE email='%s';", email))
}

func ok1(db *pg.DB) {
    query = fmt.Sprintf("SELECT * FROM users WHERE email=hello;")
    // ok: pg-sqli
    db.QueryContext(ctx, query)
}

func ok2(db *pg.DB) {
    query = "SELECT name FROM users WHERE age=" + "3"
    // ok: pg-sqli
    db.Query(ctx, query)
}

func ok3(db *pg.DB) {
    query = "SELECT name FROM users WHERE age="
    query += "3"
    // ok: pg-sqli
    db.QueryRowContext(ctx, query)
}

func ok4(db *pg.DB) {
    // ok: pg-sqli
    db.Exec(ctx, "INSERT INTO users(name, email) VALUES($1, $2)",
  "Jon Calhoun", "jon@calhoun.io")
}

func ok5(db *pg.DB) {
    // ok: pg-sqli
    db.Exec("SELECT name FROM users WHERE age=" + "3")
}

func ok6(db *pg.DB) {
    // ok: pg-sqli
    db.Exec(ctx, fmt.Sprintf("SELECT * FROM users WHERE email=hello;"))
}

func ok7() {
    opt, err := pg.ParseURL("postgres://user:pass@localhost:5432/db_name")
    if err != nil {
       panic(err)
    }

    db := pg.Connect(opt)
    if _, err := db.Prepare("my-query", "select $1::int"); err != nil {
        panic(err)
    }
    // ok: pg-sqli
    row := db.QueryContext(ctx, "my-query", 10)
}
