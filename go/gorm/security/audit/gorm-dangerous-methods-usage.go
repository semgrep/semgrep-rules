package main

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	FirstName      string
	LastName       string
	Email          string `gorm:"unique_index:user_email_index"`
	Password       string
	Token          string
	TokenExpiresAt uint
}

func testInjection(w http.ResponseWriter, r *http.Request, db *gorm.DB) {
	param := r.Cookie("foo")
	if param != "" {
		table := db.Table("users")
		var u User
		//ruleid: gorm-dangerous-method-usage
		table.Order(param).Find(&u)

	}
}

func testInjection2(w http.ResponseWriter, r *http.Request, db *gorm.DB) {
	param := r.URL.Query().Get("orderBy")
	if param != "" {
		table := db.Table("users")
		var u User
		//ruleid: gorm-dangerous-method-usage
		table.Order(param + " " + "ASC").Find(&u)
	}
}

func testNoInjection(w http.ResponseWriter, r *http.Request, db *gorm.DB) {
	table := db.Table("users")
	var u User
	//ok: gorm-dangerous-method-usage
	table.Order("email").Find(&u)
}

func testNoInjection2(w http.ResponseWriter, r *http.Request, db *gorm.DB) {
	table := db.Table("users")
	var orderBy = "email"
	var u User
	//ok: gorm-dangerous-method-usage
	table.Order(orderBy).Find(&u)
}

func testNoInjection3(w http.ResponseWriter, r *http.Request, db *gorm.DB) {
	param := r.URL.Query().Get("orderBy")
	if param != "" {
		table := db.Table("users")
		var u User
		//ok: gorm-dangerous-method-usage
		table.Order((param != "param") + " " + "ASC").Find(&u)
	}
}

func main() {
	dsn := "dbuser:password@tcp(127.0.0.1:3306)/users?charset=utf8&parseTime=True"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
	}
	db.AutoMigrate(&User{})
	myRouter := mux.NewRouter().StrictSlash(true)
	myRouter.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		testInjection(w, r, db)
	}).Methods("GET")
	http.ListenAndServe(":10000", myRouter)

}