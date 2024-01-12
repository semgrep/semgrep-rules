package main

import (
	"fmt"
	"net/http"
	"strings"
)

func newRedirectServerFmt(addr string, rootPath string) *http.Server {
	return &http.Server{
		Addr: addr,
		Handler: http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
			target := fmt.Sprintf("https://%s/path/to/%s", req.Host, req.URL.Path)
			if rootPath != "" {
				target += "/" + strings.TrimRight(strings.TrimLeft(rootPath, "/"), "/")
			}
			target += req.URL.Path
			if len(req.URL.RawQuery) > 0 {
				target += "?" + req.URL.RawQuery
			}
			// ruleid: open-redirect
			http.Redirect(w, req, target, http.StatusTemporaryRedirect)
		}),
	}
}

func newRedirectServerAdd(addr string, rootPath string) *http.Server {
	return &http.Server{
		Addr: addr,
		Handler: http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
			target := "https://" + req.Host + "/path/to/" + req.URL.Path
			if rootPath != "" {
				target += "/" + strings.TrimRight(strings.TrimLeft(rootPath, "/"), "/")
			}
			target += req.URL.Path
			if len(req.URL.RawQuery) > 0 {
				target += "?" + req.URL.RawQuery
			}
			// ruleid: open-redirect
			http.Redirect(w, req, target, http.StatusTemporaryRedirect)
		}),
	}
}

func main() {
	newRedirectServerAdd("127.0.0.1:8080", "/test")
	newRedirectServerFmt("127.0.0.1:8080", "/test")
}
