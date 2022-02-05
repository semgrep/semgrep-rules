package main

import (
	"io/ioutil"
	"log"
	"net/http"
	"path/filepath"
	"path"
	"strings"
)

const root = "/tmp"

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/bad1", func(w http.ResponseWriter, r *http.Request) {
		// ruleid: filepath-clean-misuse
		filename := filepath.Clean(r.URL.Path)
		filename := filepath.Join(root, strings.Trim(filename, "/"))
		contents, err := ioutil.ReadFile(filename)
		if err != nil {
			w.WriteHeader(http.StatusNotFound)
			return
		}
		w.Write(contents)
	})

	mux.HandleFunc("/bad2", func(w http.ResponseWriter, r *http.Request) {
		// ruleid: filepath-clean-misuse
		filename := path.Clean(r.URL.Path)
		filename := filepath.Join(root, strings.Trim(filename, "/"))
		contents, err := ioutil.ReadFile(filename)
		if err != nil {
			w.WriteHeader(http.StatusNotFound)
			return
		}
		w.Write(contents)
	})

	mux.HandleFunc("/ok", func(w http.ResponseWriter, r *http.Request) {
		filename := r.URL.Path
		// ok: filepath-clean-misuse
		filename := filepath.Join(root, strings.Trim(filename, "/"))
		contents, err := ioutil.ReadFile(filename)
		if err != nil {
			w.WriteHeader(http.StatusNotFound)
			return
		}
		w.Write(contents)
	})

	server := &http.Server{
		Addr:    "127.0.0.1:50000",
		Handler: mux,
	}

	log.Fatal(server.ListenAndServe())
}