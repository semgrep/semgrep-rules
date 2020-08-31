package main

import (
	"fmt"
	"html/template"
	"net/http"
	"strconv"
)

func Fine(r *http.Request) template.HTML {
	// ok
	return template.HTML("<html><body><h1>Hello, world</h1></body></html>")
}

func AlsoFine(r *http.Request) template.HTML {
	// ok
	return template.HTML("<html><body><h1>" + "Hello, world</h1></body></html>")
}

func Concat(r *http.Request) template.HTML {
	customerId := r.URL.Query().Get("id")
	tmpl := "<html><body><h1>" + customerId + "</h1></body></html>"

	// ruleid: template-html-does-not-escape
	return template.HTML(tmpl)
}

func ConcatBranch(r *http.Request) template.HTML {
	customerId := r.URL.Query().Get("id")
	doIt, err := strconv.ParseBool(r.URL.Query().Get("do"))
	if err != nil {
		return template.HTML("")
	}
	var tmpl string
	if doIt {
		tmpl = "<html><body><h1>" + customerId + "</h1></body></html>"
	} else {
		tmpl = ""
	}

	// ruleid: template-html-does-not-escape
	return template.HTML(tmpl)
}

func ConcatInline(r *http.Request) template.HTML {
	customerId := r.URL.Query().Get("id")

	// ruleid: template-html-does-not-escape
	return template.HTML("<html><body><h1>" + customerId + "</h1></body></html>")
}

func ConcatInlineOneside(r *http.Request) template.HTML {
	customerId := r.URL.Query().Get("id")

	// ruleid: template-html-does-not-escape
	return template.HTML("<html><body><h1>" + customerId)
}

func Formatted(r *http.Request) template.HTML {
	customerId := r.URL.Query().Get("id")
	tmpl, err := fmt.Printf("<html><body><h1>%s</h1></body></html>", customerId)
	if err != nil {
		return template.HTML("")
	}
	// ruleid: template-html-does-not-escape
	return template.HTML(tmpl)
}

func FormattedInline(r *http.Request) template.HTML {
	customerId := r.URL.Query().Get("id")
	// ruleid: template-html-does-not-escape
	return template.HTML(fmt.Sprintf("<html><body><h1>%s</h1></body></html>", customerId))
}

func main() {}
