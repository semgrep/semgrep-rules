package main

import "database/sql"
import "fmt"

func bad1() {
    pgxConfig := pgx.ConnConfig{
        Host:     "localhost",
        Database: "quetest",
        User:     "quetest",
    }
    pgxConnPoolConfig := pgx.ConnPoolConfig{pgxConfig, 3, nil}
    conn, err := pgx.NewConnPool(pgxConnPoolConfig)
    if err != nil {
        log.Fatal(err)
    }
    query = "SELECT name FROM users WHERE age=" + req.FormValue("age")
    // ruleid: pgx-sqli
    rows, err := conn.Query(query)
}

func bad2() {
    conn, err := pgx.Connect(context.Background(), os.Getenv("DATABASE_URL"))
    if err != nil {
        panic(err)
    }
    query = "SELECT name FROM users WHERE age=" + req.FormValue("age")
    // ruleid: pgx-sqli
    conn.QueryEx(query)
}

func bad3() {
    config, err := pgx.ParseConfig(os.Getenv("DATABASE_URL"))
    if err != nil {
       panic(err)
    }
    config.Logger = log15adapter.NewLogger(log.New("module", "pgx"))

    conn, err := pgx.ConnectConfig(context.Background(), config)

    query = "SELECT name FROM users WHERE age="
    query += req.FormValue("age")
    // ruleid: pgx-sqli
    conn.QueryRow(query)
}

func bad4(conn *pgx.Conn) {
    query = fmt.Sprintf("SELECT * FROM users WHERE email='%s';", email)
    // ruleid: pgx-sqli
    conn.Exec(query)
}

func bad4(conn *pgx.Conn) {
    // ruleid: pgx-sqli
    conn.Exec("SELECT name FROM users WHERE age=" + req.FormValue("age"))
}

func bad5(conn *pgx.Conn) {
    // ruleid: pgx-sqli
    conn.ExecEx(fmt.Sprintf("SELECT * FROM users WHERE email='%s';", email))
}

func ok1(conn *pgx.Conn) {
    query = fmt.Sprintf("SELECT * FROM users WHERE email=hello;")
    // ok: pgx-sqli
    conn.QueryRowEx(query)
}

func ok2(conn *pgx.Conn) {
    query = "SELECT name FROM users WHERE age=" + "3"
    // ok: pgx-sqli
    conn.Query(query)
}

func ok3(conn *pgx.Conn) {
    query = "SELECT name FROM users WHERE age="
    query += "3"
    // ok: pgx-sqli
    conn.QueryRow(query)
}

func ok4(conn *pgx.Conn) {
    // ok: pgx-sqli
    conn.Exec("INSERT INTO users(name, email) VALUES($1, $2)",
  "Jon Calhoun", "jon@calhoun.io")
}

func ok5(conn *pgx.Conn) {
    // ok: pgx-sqli
    conn.Exec("SELECT name FROM users WHERE age=" + "3")
}

func ok6(conn *pgx.Conn) {
    // ok: pgx-sqli
    conn.Exec(fmt.Sprintf("SELECT * FROM users WHERE email=hello;"))
}

func ok7() {
    conf := pgx.ConnPoolConfig{
        ConnConfig: pgx.ConnConfig{
            Host:     "/run/postgresql",
            User:     "postgres",
            Database: "test",
        },
        MaxConnections: 5,
    }
    db, err := pgx.NewConnPool(conf)
    if err != nil {
        panic(err)
    }
    if _, err := db.Prepare("my-query", "select $1::int"); err != nil {
        panic(err)
    }
    // ok: pgx-sqli
    row := db.QueryRow("my-query", 10)
    var i int
    if err := row.Scan(&i); err != nil {
        panic(err)
    }
    fmt.Println(i)
}
