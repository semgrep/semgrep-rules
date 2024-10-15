package main

import (
	"net/http"
	"net/url"
)

var redirectURL, _ = url.Parse("https://example.com")

func getRedirectToken() (string, error) {
	return "abcd", nil
}

func handler1(w http.ResponseWriter, r *http.Request) {
	u := redirectURL
	q := u.Query()

	// opaque process that might fail
	token, err := getRedirectToken()
	if err != nil {
		q.Set("error", err.Error())
	} else {
		q.Set("token", token)
	}
	// ruleid: shared-url-struct-mutation
	u.RawQuery = q.Encode()
	r.URL.RawQuery = q.Encode()

	http.Redirect(w, r, u.String(), http.StatusFound)
}

func handler2(w http.ResponseWriter, r *http.Request) {
	u, _ := url.Parse("https://example.com")

	q := u.Query()

	// opaque process that might fail
	token, err := getRedirectToken()
	if err != nil {
		q.Set("error", err.Error())
	} else {
		q.Set("token", token)
	}
	// ok: shared-url-struct-mutation
	u.RawQuery = q.Encode()

	http.Redirect(w, r, u.String(), http.StatusFound)
}

func handler3(w http.ResponseWriter, r *http.Request) {
	u := url.URL{
		Scheme: "https",
		Host:   "example.com",
		Path:   "/",
	}
	q := u.Query()

	// opaque process that might fail
	token, err := getRedirectToken()
	if err != nil {
		q.Set("error", err.Error())
	} else {
		q.Set("token", token)
	}

	u.RawQuery = q.Encode()

	http.Redirect(w, r, u.String(), http.StatusFound)
}

func handler4(w http.ResponseWriter, r *http.Request) {
	var u *url.URL
	if true {
		u, _ = url.Parse("https://example.com")
	}

	if u != nil {

		q := u.Query()

		// opaque process that might fail
		token, err := getRedirectToken()
		if err != nil {
			q.Set("error", err.Error())
		} else {
			q.Set("token", token)
		}
		// ok: shared-url-struct-mutation
		u.RawQuery = q.Encode()

		http.Redirect(w, r, u.String(), http.StatusFound)
	}
	http.Redirect(w, r, "https://google.com", http.StatusFound)
}

func extraCases(w http.ResponseWriter, r *http.Request) {
	var x struct {
		y []struct {
			Path string
		}
	}
	// ok: shared-url-struct-mutation
	r.URL.RawQuery = "abcd"
	// ok: shared-url-struct-mutation
	x.y[0].Path = "abcd"

	a, _ := url.ParseRequestURI("https://example.com")
	// ok: shared-url-struct-mutation
	a.RawQuery = "abcd"
}

func main() {
	http.HandleFunc("/1", handler1)
	http.HandleFunc("/2", handler2)
	http.HandleFunc("/3", handler3)
	http.HandleFunc("/4", handler4)
	http.ListenAndServe(":7777", nil)
}
