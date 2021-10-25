package main

import (
    "crypto/tls"
    "encoding/json"
    "fmt"
    "io/ioutil"
    "net/http"
    "net/url"
)

func handlerIndex(w http.ResponseWriter, r *http.Request) {
    tr := &http.Transport{
            TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
        }

    client := &http.Client{Transport: tr}

    if r.Method == "POST" && r.URL.Path == "/api" {
        // ruleid: tainted-url-host
        url := fmt.Sprintf("https://%v/api", r.URL.Query().Get("proxy"))

        resp, err := client.Post(url, "application/json", r.Body)

        if err != nil {
            w.WriteHeader(http.StatusInternalServerError)
            return
        }

        defer resp.Body.Close()

        if resp.StatusCode != 200 {
            w.WriteHeader(500)
            return
        }

        w.Write([]byte(fmt.Sprintf("{\"host\":\"%v\"}", r.URL.Query().Get("proxy"))))
        return
    } else {
        proxy := r.URL.Query()["proxy"]
        secure := r.URL.Query()["secure"]

        if (secure) {
            // ruleid: tainted-url-host
            url := fmt.Sprintf("https://%s", proxy)
        } else {
            // ruleid: tainted-url-host
            url := fmt.Sprintf("http://%q", proxy)
        }
        resp, err := client.Post(url, "application/json", r.Body)
    }
}

func handlerOther(w http.ResponseWriter, r *http.Request) {
    tr := &http.Transport{
            TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
        }

    client := &http.Client{Transport: tr}

    if r.Method == "POST" && r.URL.Path == "/api" {
        // ruleid: tainted-url-host
        url := fmt.Printf("https://%v/api", r.URL.Query().Get("proxy"))

        resp, err := client.Post(url, "application/json", r.Body)

        if err != nil {
            w.WriteHeader(http.StatusInternalServerError)
            return
        }

        defer resp.Body.Close()

        if resp.StatusCode != 200 {
            w.WriteHeader(500)
            return
        }

        w.Write([]byte(fmt.Sprintf("{\"host\":\"%v\"}", r.URL.Query().Get("proxy"))))
        return
    } else {
        proxy := r.URL.Query()["proxy"]
        secure := r.URL.Query()["secure"]

        if (secure) {
            // ruleid: tainted-url-host
            fmt.Fprintf(w, "https://%s", proxy)
        } else {
            // ruleid: tainted-url-host
            fmt.Fprintf(w, "http://%q", proxy)
        }
        resp, err := client.Post(url, "application/json", r.Body)
    }
}

func handlerOk(w http.ResponseWriter, r *http.Request) {
    tr := &http.Transport{
            TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
        }

    client := &http.Client{Transport: tr}

    if r.Method == "POST" && r.URL.Path == "/api" {
        // ok: tainted-url-host
        url := fmt.Printf("https://example.com/%v", r.URL.Query().Get("proxy"))

        resp, err := client.Post(url, "application/json", r.Body)

        if err != nil {
            w.WriteHeader(http.StatusInternalServerError)
            return
        }

        defer resp.Body.Close()

        if resp.StatusCode != 200 {
            w.WriteHeader(500)
            return
        }

        w.Write([]byte(fmt.Sprintf("{\"host\":\"%v\"}", r.URL.Query().Get("proxy"))))
        return
    } else {
        proxy := r.URL.Query()["proxy"]
        secure := r.URL.Query()["secure"]

        if (secure) {
            // ok: tainted-url-host
            url := fmt.Sprintf("https://example.com/%s", proxy)
        } else {
            // ok: tainted-url-host
            fmt.Fprintf(w, "http://example.com/%q", proxy)
        }
        resp, err := client.Post(url, "application/json", r.Body)
    }
}

func newRedirectServer(addr string, rootPath string) *http.Server {
    return &http.Server{
        Addr: addr,
        Handler: http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
            // ruleid: tainted-url-host
            target := "https://" + req.Host
            if rootPath != "" {
                target += "/" + strings.TrimRight(strings.TrimLeft(rootPath, "/"), "/")
            }
            target += req.URL.Path
            if len(req.URL.RawQuery) > 0 {
                target += "?" + req.URL.RawQuery
            }
            http.Redirect(w, req, target, http.StatusTemporaryRedirect)
        }),
    }
}

func main() {
    http.HandleFunc("/", handlerIndex)
    http.HandleFunc("/other", handleOther)
    http.HandleFunc("/ok", handleOk)
    http.ListenAndServe(":8888", nil)
}
