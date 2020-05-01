package main

import (
	"net/http"
	"net/http/cgi"
)

func main() {
	// ruleid: insecure-module-used
	cgi.Serve(http.FileServer(http.Dir("/usr/share/doc")))
}
