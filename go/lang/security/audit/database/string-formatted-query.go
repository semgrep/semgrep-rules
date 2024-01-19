package main

import (
	"context"
	"database/sql"
	"fmt"
	"http"

	"github.com/jackc/pgx/v4"
)

var db *sql.DB
var postgresDb *pgx.Conn

func dbExec(r *http.Request) {
	customerId := r.URL.Query().Get("id")
	// ruleid: string-formatted-query
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = " + customerId

	row, _ := db.Exec(query)

	// ok: string-formatted-query
	out, err := sshClient.Exec(fmt.Sprintf("sudo bash %s", scriptPath))
}

func okDbExec(r *http.Request) {
	customerId := r.URL.Query().Get("id")
	// ok: string-formatted-query
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = customerId"

	row, _ := db.Exec(query)
}

func dbQuery1(r *http.Request) {
    // ruleid: string-formatted-query
    _, err = db.Query("INSERT into users (username, password) VALUES(" + username + ", " + password)
    if err != nil {
        http.Error("mistake")
    }
}

func dbQuery2(r *http.Request, username string, password string) {
    // ruleid: string-formatted-query
    query = "INSERT into users (username, password) VALUES(" + username + ", " + password
    _, err = db.QueryRow(query)
    if err != nil {
        http.Error("mistake")
    }
}

func dbQuery3(r *http.Request, username string) {
    // ruleid: string-formatted-query
    query = username + " AND INSERT into users (username, password)"
    _, err = db.Exec(query)
    if err != nil {
        http.Error("mistake")
    }
}

func dbQuery4(r *http.Request, username string) {
    // ruleid: string-formatted-query
    query := fmt.Sprintf("%s AND INSERT into users (username, password)", username)
    _, err = db.Exec(query)
    if err != nil {
        http.Error("mistake")
    }
}

func dbQuery5(r *http.Request, username string, password string) {
	// ruleid: string-formatted-query
	query := fmt.Sprintf("INSERT into users (username, password) VALUES(%s, %s)", username, password)
	_, err = db.QueryRow(query)
	if err != nil {
		http.Error("mistake")
	}
}

func okDbQuery1(r *http.Request) {
    // ok: string-formatted-query
    _, err = db.Exec("INSERT into users (username, password) VALUES(" + "username" + ", " + "smth)")
    if err != nil {
        http.Error("mistake")
    }
}

func dbExecContext(r *http.Request) {
	ctx := context.Background()
	customerId := r.URL.Query().Get("id")
	// ruleid: string-formatted-query
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = " + customerId

	row, _ := db.ExecContext(ctx, query)
}

func dbQuery4(r *http.Request) {
	customerId := r.URL.Query().Get("id")
	// ruleid: string-formatted-query
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = " + customerId

	row, _ := db.Query(query)
}

func dbQueryContext(r *http.Request) {
	ctx := context.Background()
	customerId := r.URL.Query().Get("id")
	// ruleid: string-formatted-query
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = " + customerId

	row, _ := db.QueryContext(ctx, query)
}

func dbQueryRow(r *http.Request) {
	customerId := r.URL.Query().Get("id")
	// ruleid: string-formatted-query
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = " + customerId

	row, _ := db.QueryRow(query)
}

func dbQueryRowContext(r *http.Request) {
	ctx := context.Background()
	customerId := r.URL.Query().Get("id")
	// ruleid: string-formatted-query
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = " + customerId

	row, _ := db.QueryRowContext(ctx, query)
}

func dbExecFmt(r *http.Request) {
	customerId := r.URL.Query().Get("id")
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s"
	// ruleid: string-formatted-query
    query = fmt.Printf(query, customerId)

	row, _ := db.Exec(query)
}

func dbExecContextFmt(r *http.Request) {
	ctx := context.Background()
	customerId := r.URL.Query().Get("id")
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s"
	// ruleid: string-formatted-query
    query = fmt.Printf(query, customerId)

	row, _ := db.ExecContext(ctx, query)
}

func dbQueryFmt(r *http.Request) {
	customerId := r.URL.Query().Get("id")
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s"
	// ruleid: string-formatted-query
    query = fmt.Printf(query, customerId)

	row, _ := db.Query(query)
}

func dbQueryContextFmtReassign(r *http.Request) {
	ctx := context.Background()
	customerId := r.URL.Query().Get("id")
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s"
	// ruleid: string-formatted-query
    query = fmt.Printf(query, customerId)

	row, _ := db.QueryContext(ctx, query)
}


func dbQueryContextFmt(r *http.Request) {
	ctx := context.Background()
	customerId := r.URL.Query().Get("id")
	// ruleid: string-formatted-query
	query := fmt.Sprintf("SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s", customerId)
	row, _ := db.QueryContext(ctx, query)
}

func dbQueryRowFmt(r *http.Request) {
	customerId := r.URL.Query().Get("id")
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s"
		// ruleid: string-formatted-query
	query = fmt.Printf(query, customerId)

	row, _ := db.QueryRow(query)
}

func dbQueryRowContextReassign(r *http.Request) {
	ctx := context.Background()
	customerId := r.URL.Query().Get("id")
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s"
	// ruleid: string-formatted-query
    query = fmt.Printf(query, customerId)

	row, _ := db.QueryRowContext(ctx, query)
}

func dbQueryRowContextFmt(r *http.Request) {
	ctx := context.Background()
	customerId := r.URL.Query().Get("id")
	// ruleid: string-formatted-query
	query := fmt.Sprintf("SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s", customerId)

	row, _ := db.QueryRowContext(ctx, query)
}

func unmodifiedString() {
	// ok: string-formatted-query
	query := "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = 1234"
	row, _ := db.Query(query)
}

func unmodifiedStringDirectly() {
    // ok: string-formatted-query
	row, _ := db.Query("SELECT number, expireDate, cvv FROM creditcards WHERE customerId = 1234")
}

func badDirectQueryAdd(r *http.Request) {
    ctx := context.Background()
    customerId := r.URL.Query().Get("id")

	// ruleid: string-formatted-query
    row, _ := db.QueryRowContext(ctx, "SELECT number, expireDate, cvv FROM creditcards WHERE customerId = " + customerId)
}

func badDirectQueryFmt(r *http.Request) {
    ctx := context.Background()
    customerId := r.URL.Query().Get("id")

	// ruleid: string-formatted-query
    row, _ := db.QueryRowContext(ctx, fmt.Printf("SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s", customerId))
}

func postgresBadDirectQueryFmt(r *http.Request) {
    ctx := context.Background()
    customerId := r.URL.Query().Get("id")

	// ruleid: string-formatted-query
    row, _ := postgresDb.QueryRow(ctx, fmt.Printf("SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s", customerId))
}

func postgresQueryFmt(r *http.Request) {
    ctx := context.Background()
    customerId := r.URL.Query().Get("id")
	// ruleid: string-formatted-query
	query := fmt.Sprintf("SELECT number, expireDate, cvv FROM creditcards WHERE customerId = %s", customerId)

    row, _ := postgresDb.QueryRow(ctx, query)
}

package main

import (
    "context"
    "database/sql"
    "fmt"
    "http"

    "github.com/jackc/pgx/v4"
)
// cf. https://github.com/returntocorp/semgrep-rules/issues/1249
func new() {
	// ok: string-formatted-query
    var insertSql string = "insert into t_ad_experiment (exp_layer,buckets,opposite_buckets,is_transparent, " +
    " description,is_full,start_time,end_time,creat_time,update_time,update_user,white_list,extra,status)" +
    " value (?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
    t := time.Now().Unix()
    InsertResult, err := DbConn.Exec(insertSql, info.Exp_layer, info.Buckets, info.Opposite_buckets,
        info.Is_transparent, info.Description, info.Is_full, info.Start_time, info.End_time, t, t,
        session.User, info.White_list, info.Extra, 0)
}

func new2() {
	// ok: string-formatted-query
    var insertSql string = "insert into t_ad_experiment (exp_layer,buckets,opposite_buckets,is_transparent, description,is_full,start_time,end_time,creat_time,update_time,update_user,white_list,extra,status) value (?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
    t := time.Now().Unix()
    InsertResult, err := DbConn.Exec(insertSql, info.Exp_layer, info.Buckets, info.Opposite_buckets,
        info.Is_transparent, info.Description, info.Is_full, info.Start_time, info.End_time, t, t,
        session.User, info.White_list, info.Extra, 0)
}
