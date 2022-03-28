package main

import (
	"fmt"
	"html/template"
	"net/http"
)

type User struct {
	ID       int
	Email    string
	Password string
}

func match1(w http.ResponseWriter, req *http.Request) {

	var user1 = &User{1, "user@gmail.com", "Sup3rSecr3t123!"}
	query := req.URL.Query().Get("query")
	// ruleid:go-ssti
	var text = fmt.Sprintf(`
	<html>
	<head>
	<title>SSTI</title>
	</head>
	<body>
		<h2>Hello {{ .Email }}</h2>
		<p>Search result for %s</p>
	</body></html>
	`, query)
	tmpl := template.New("hello")
	tmpl, err := tmpl.Parse(text)
	if err != nil {
		fmt.Println(err)
	}
	tmpl.Execute(w, user1)
}

func match2(w http.ResponseWriter, req *http.Request) {

	var user1 = &User{1, "user@gmail.com", "Sup3rSecr3t123!"}
	if err := req.ParseForm(); err != nil {
		fmt.Fprintf(w, "ParseForm() err: %v", err)
		return
	}
	query := req.Form.Get("query")
	// ruleid:go-ssti
	var text = fmt.Sprintf(`
	<html>
	<head>
	<title>SSTI</title>
	</head>
	<body>
		<h2>Hello {{ .Email }}</h2>
		<p>Search result for %s</p>
	</body></html>
	`, query)
	tmpl := template.New("hello")
	tmpl, err := tmpl.Parse(text)
	if err != nil {
		fmt.Println(err)
	}
	tmpl.Execute(w, user1)
}

func no_match(w http.ResponseWriter, req *http.Request) {

	var user1 = &User{1, "user@gmail.com", "Sup3rSecr3t123!"}
	query := "constant string"
	// ok:go-ssti
	var text = fmt.Sprintf(`
	<html>
	<head>
	<title>SSTI</title>
	</head>
	<body>
		<h2>Hello {{ .Email }}</h2>
		<p>Search result for %s</p>
	</body></html>
	`, query)
	tmpl := template.New("hello")
	tmpl, err := tmpl.Parse(text)
	if err != nil {
		fmt.Println(err)
	}
	tmpl.Execute(w, user1)
}
