package main

import (
    "fmt"
    "path"

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
    // ruleid: pg-orm-sqli
    err := db.Model(book).
        Where("id > ?", 100).
        WhereOr(query).
        Limit(1).
        Select()
}

func bad2() {
    db := pg.Connect(opt)
    query = fmt.Sprintf("SELECT * FROM users WHERE email='%s';", email)
    story := new(Story)
    // ruleid: pg-orm-sqli
    err = db.Model(story).
        Relation("Author").
        From("Hello").
        Where("SELECT name FROM users WHERE age=" + req.FormValue("age")).
        Select()
    if err != nil {
        panic(err)
    }
}

func bad3() {
   opt, err := pg.ParseURL("postgres://user:pass@localhost:5432/db_name")
    if err != nil {
        panic(err)
    }

    db := pg.Connect(opt)

    query = "SELECT name FROM users WHERE age="
    query += req.FormValue("age")
    // ruleid: pg-orm-sqli
    err := db.Model(book).
    Where(query).
    WhereGroup(func(q *pg.Query) (*pg.Query, error) {
        q = q.WhereOr("id = 1").
            WhereOr("id = 2")
        return q, nil
    }).
    Limit(1).
    Select()
}

func bad4(db *pg.DB) {
    query = fmt.Sprintf("SELECT * FROM users WHERE email='%s';", email)
    // ruleid: pg-orm-sqli
    err := db.Model((*Book)(nil)).
    Column("author_id").
    ColumnExpr(query).
    Group("author_id").
    Order("book_count DESC").
    Select(&res)
}

func bad5(db *pg.DB) {
    // ruleid: pg-orm-sqli
    err = db.Model((*Book)(nil)).
    Column("title", "text").
    Where("SELECT name FROM users WHERE age=" + req.FormValue("age")).
    Select()
}

func bad6(db *pg.DB) {
    // ruleid: pg-orm-sqli
    err = db.Model((*Book)(nil)).
    Column("title", "text").
    Where(fmt.Sprintf("SELECT * FROM users WHERE email='%s';",    email)).
    Select()
}

func ok1(db *pg.DB) {
    query = fmt.Sprintf("SELECT * FROM users WHERE email=hello;")
    // ok: pg-orm-sqli
    err = db.Model((*Book)(nil)).
    Column("title", "text").
    Where(query).
    Select()
}

func ok2(db *pg.DB) {
    query = "SELECT name FROM users WHERE age=" + "3"
    // ok: pg-orm-sqli
    err = db.Model((*Book)(nil)).
    Column("title", "text").
    ColumnExpr(query).
    Select()
}

func ok3(db *pg.DB) {
    query = "SELECT name FROM users WHERE age="
    query += "3"
    // ok: pg-orm-sqli
    err = db.Model((*Book)(nil)).
    Column("title", "text").
    Where(query).
    Select()
}

func ok4(db *pg.DB) {
    // ok: pg-orm-sqli
    err := db.Model((*Book)(nil)).
    Column("title", "text").
    Where("id = ?", 1).
    Select(&title, &text)
}

func ok5(db *pg.DB) {
    // ok: pg-orm-sqli
    err := db.Model((*Book)(nil)).
    Column("title", "text").
    Where("SELECT name FROM users WHERE age=" + "3").
    Select(&title, &text)
}

func ok6(db *pg.DB) {
    // ok: pg-orm-sqli
    err := db.Model().
    ColumnExpr(fmt.Sprintf("SELECT * FROM users WHERE email=hello;"))
}

func ok7() {
    // ok: pg-orm-sqli
    path.Join("foo", fmt.Sprintf("%s.baz", "bar"))
}

func ok8() {
    // ok: pg-orm-sqli
    filepath.Join("foo", fmt.Sprintf("%s.baz", "bar"))
}
