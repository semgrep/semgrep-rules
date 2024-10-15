package main

import (
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
)

func NewProxy(targetHost string) (*httputil.ReverseProxy, error) {
	url, err := url.Parse(targetHost)
	if err != nil {
		return nil, err
	}

	proxy := httputil.NewSingleHostReverseProxy(url)

	originalDirector := proxy.Director
	// ruleid: reverseproxy-director
	proxy.Director = func(req *http.Request) {
		originalDirector(req)
		modifyRequest(req)
	}
	return proxy, nil
}

func modifyRequest(req *http.Request) {
	req.Header.Set("Extra-Header", "nice")
}

func ProxyRequestHandler(proxy *httputil.ReverseProxy) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		proxy.ServeHTTP(w, r)
	}
}

type Fake struct {
	Director string
}

func extraCases() {
	rp := &httputil.ReverseProxy{
		// ruleid: reverseproxy-director
		Director: func(req *http.Request) {
			modifyRequest(req)
		},
	}
	_ = rp

	f := Fake{
		// ok: reverseproxy-director
		Director: "abcd",
	}
	_ = f
}

func main() {
	proxy, err := NewProxy("https://example.com")
	if err != nil {
		panic(err)
	}

	http.HandleFunc("/", ProxyRequestHandler(proxy))
	log.Fatal(http.ListenAndServe(":8080", nil))
}
