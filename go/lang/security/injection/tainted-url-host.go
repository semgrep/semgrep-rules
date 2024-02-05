package main

import (
	"crypto/tls"
	"encoding/hex"
	"fmt"
	"io/ioutil"
	"net/http"
)

func handlerIndexFmt(w http.ResponseWriter, r *http.Request) {
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{Transport: tr}

	if r.Method == "POST" && r.URL.Path == "/api" {
		url := fmt.Sprintf("https://%v/api", r.URL.Query().Get("proxy"))

		// ruleid: tainted-url-host
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

		url := ""
		if secure {
			url = fmt.Sprintf("https://%s", proxy)
		} else {
			url = fmt.Sprintf("http://%q", proxy)
		}
		// ruleid: tainted-url-host
		resp, err := client.Post(url, "application/json", r.Body)
	}
}

func handlerOtherFmt(w http.ResponseWriter, r *http.Request) {
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{Transport: tr}

	if r.Method == "POST" && r.URL.Path == "/api" {
		url := fmt.Printf("https://%v/api", r.URL.Query().Get("proxy"))

		// ruleid: tainted-url-host
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

		url := ""
		if secure {
			url = fmt.Fprintf(w, "https://%s", proxy)
		} else {
			url = fmt.Fprintf(w, "http://%q", proxy)
		}
		// ruleid: tainted-url-host
		resp, err := client.Post(url, "application/json", r.Body)
	}
}

func handlerOkFmt(w http.ResponseWriter, r *http.Request) {
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{Transport: tr}

	if r.Method == "POST" && r.URL.Path == "/api" {
		url := fmt.Printf("https://example.com/%v", r.URL.Query().Get("proxy"))

		// ok: tainted-url-host
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

		url := ""
		if secure {
			url = fmt.Sprintf("https://example.com/%s", proxy)
		} else {
			url = fmt.Fprintf(w, "http://example.com%q", proxy)
		}
		// ok: tainted-url-host
		resp, err := client.Post(url, "application/json", r.Body)
	}
}

func (s *server) handlerBadFmt(w http.ResponseWriter, r *http.Request) {
	urls, ok := r.URL.Query()["url"] // extract url from query params

	if !ok {
		http.Error(w, "url missing", 500)
		return
	}

	if len(urls) != 1 {
		http.Error(w, "url missing", 500)
		return
	}

	url := fmt.Sprintf("//%s/path", urls[0])

	// ruleid: tainted-url-host
	resp, err := http.Get(url) // sink
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	client := &http.Client{}

	// ruleid: tainted-url-host
	req2, err := http.NewRequest("GET", url, nil)
	_, err2 := client.Do(req2)
	if err2 != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	// ok: tainted-url-host
	_, err3 := http.Get("https://semgrep.dev")
	if err3 != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	url4 := fmt.Sprintf("ftps://%s/path/to/%s", "test", r.URL.Path)
	// ok: tainted-url-host
	_, err4 := http.Get("https://semgrep.dev")
	if err3 != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	defer resp.Body.Close()

	bytes, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	// Write out the hexdump of the bytes as plaintext.
	w.Header().Set("Content-Type", "text/plain; charset=utf-8")
	fmt.Fprint(w, hex.Dump(bytes))
}

func handlerIndexAdd(w http.ResponseWriter, r *http.Request) {
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{Transport: tr}

	if r.Method == "POST" && r.URL.Path == "/api" {
		url := "https://" + r.URL.Query().Get("proxy") + "/api"

		// ruleid: tainted-url-host
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

		url := ""
		if secure {
			url = "https://" + proxy
		} else {
			url = "http://" + proxy
		}
		// ruleid: tainted-url-host
		resp, err := client.Post(url, "application/json", r.Body)
	}
}

func handlerOtherAdd(w http.ResponseWriter, r *http.Request) {
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{Transport: tr}

	if r.Method == "POST" && r.URL.Path == "/api" {
		url := "https://" + r.URL.Query().Get("proxy") + "/api"

		// ruleid: tainted-url-host
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

		url := ""
		if secure {
			url = "https://example.com/" + proxy
		} else {
			url = "http://example.com/api/test/" + proxy
		}
		// ok: tainted-url-host
		resp, err := client.Post(url, "application/json", r.Body)
	}
}

func handlerOkAdd(w http.ResponseWriter, r *http.Request) {
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{Transport: tr}

	if r.Method == "POST" && r.URL.Path == "/api" {
		// ok: tainted-url-host
		resp, err := client.Post("https://example.com/"+r.URL.Query().Get("proxy"), "application/json", r.Body)

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

		url := ""
		if secure {
			url = "https://example.com/" + proxy
		} else {
			url = "http://example.com" + proxy
		}
		// ok: tainted-url-host
		resp, err := client.Post(url, "application/json", r.Body)
	}
}

func (s *server) handlerBadAdd(w http.ResponseWriter, r *http.Request) {
	urls, ok := r.URL.Query()["url"] // extract url from query params

	if !ok {
		http.Error(w, "url missing", 500)
		return
	}

	if len(urls) != 1 {
		http.Error(w, "url missing", 500)
		return
	}

	url := urls[0]

	// ruleid: tainted-url-host
	resp, err := http.Get(url) // sink
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	client := &http.Client{}

	// ruleid: tainted-url-host
	req2, err := http.NewRequest("GET", r.URL.Path, nil)
	_, err2 := client.Do(req2)
	if err2 != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	// ok: tainted-url-host
	_, err3 := http.Get("https://semgrep.dev")
	if err3 != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	url4 := fmt.Sprintf("ftps://%s/path/to/%s", "test", r.URL.Path)
	// ok: tainted-url-host
	_, err4 := http.Get("https://semgrep.dev")
	if err3 != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	defer resp.Body.Close()

	bytes, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	// Write out the hexdump of the bytes as plaintext.
	w.Header().Set("Content-Type", "text/plain; charset=utf-8")
	fmt.Fprint(w, hex.Dump(bytes))
}

func main() {
	http.HandleFunc("/", handlerIndex)
	http.HandleFunc("/other", handleOther)
	http.HandleFunc("/ok", handleOk)
	http.HandleFunc("/bad", handlerBad)
	http.ListenAndServe(":8888", nil)
}
