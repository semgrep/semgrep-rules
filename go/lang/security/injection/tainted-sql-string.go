package main

import (
    "crypto/tls"
    "encoding/json"
    "fmt"
    "io/ioutil"
    "net/http"
    "net/url"
    "database/sql"
)

func DeleteHandler(db *sql.DB) func(w http.ResponseWriter, req *http.Request) {
    return func(w http.ResponseWriter, req *http.Request) {
        del := req.URL.Query().Get("del")
        id := req.URL.Query().Get("Id")
        if del == "del" {
            // ruleid: tainted-sql-string
            _, err = db.Exec("DELETE FROM table WHERE Id = " + id)
            if err != nil {
                panic(err)
            }
        }
    }
}

func DeleteHandlerOk(db *sql.DB) func(w http.ResponseWriter, req *http.Request) {
    return func(w http.ResponseWriter, req *http.Request) {
        del := req.URL.Query().Get("del")
        idhtml := req.URL.Query().Get("Id")

        id, _ := strconv.Atoi(idhtml)

        if del == "del" {
            // ok: tainted-sql-string
            _, err = db.Exec("DELETE FROM table WHERE Id = " + id)
            if err != nil {
                panic(err)
            }
        }
    }
}

func SelectHandler(db *sql.DB) func(w http.ResponseWriter, req *http.Request) {
    return func(w http.ResponseWriter, req *http.Request) {
        del := req.URL.Query().Get("del")
        id := req.URL.Query().Get("Id")
        if del == "del" {
            // ruleid: tainted-sql-string
            sql := fmt.Sprintf("SELECT * FROM table WHERE Id = %v", id)
            _, err = db.Exec(sql)
            if err != nil {
                panic(err)
            }
        }
    }
}

func SelectHandlerOk(db *sql.DB) func(w http.ResponseWriter, req *http.Request) {
    return func(w http.ResponseWriter, req *http.Request) {
        del := req.URL.Query().Get("del")
        id := req.URL.Query().Get("Id")

        if del == "del" {
            // ok: tainted-sql-string
            _, err = db.QueryRow("SELECT * FROM table WHERE Id = $1", id)

            // ok: tainted-sql-string
            fmt.Fprintf(w, "Deleted %s", id)
            if err != nil {
                panic(err)
            }
        }
    }
}
