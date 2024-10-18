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
		filename := filepath.FromSlash(filepath.Clean("/"+strings.Trim(r.URL.Path, "/")))
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
		filename := filepath.FromSlash(filepath.Clean("/"+strings.Trim(r.URL.Path, "/")))
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

	mux.HandleFunc("/ok2", func(w http.ResponseWriter, r *http.Request) {
		// ok: filepath-clean-misuse
		filename := path.Clean("/" + r.URL.Path)
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

// TODO
// func NewHandlerWithDefault(root http.FileSystem, handler http.Handler, defaultPath string, gatewayDomains []string) http.Handler {
// 	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
// 		if isGatewayRequest(r) {
// 			// s3 signed request reaching the ui handler, return an error response instead of the default path
// 			o := operations.Operation{}
// 			err := errors.Codes[errors.ERRLakeFSWrongEndpoint]
// 			err.Description = fmt.Sprintf("%s (%v)", err.Description, gatewayDomains)
// 			o.EncodeError(w, r, err)
// 			return
// 		}
// 		urlPath := r.URL.Path
// 		// We want this rule to only fire when urlPath does not have
// 		// a slash in front. This if condition ensures there is a slash,
// 		// so the line marked 'ok' below should not fire.
// 		if !strings.HasPrefix(urlPath, "/") {
// 			urlPath = "/" + urlPath
// 			r.URL.Path = urlPath
// 		}
// 		// ok: filepath-clean-misuse
// 		_, err := root.Open(path.Clean(urlPath))
// 		if err != nil && os.IsNotExist(err) {
// 			r.URL.Path = defaultPath
// 		}
// 		// consistent content-type
// 		contentType := gomime.TypeByExtension(filepath.Ext(r.URL.Path))
// 		if contentType != "" {
// 			w.Header().Set("Content-Type", contentType)
// 		}
// 		handler.ServeHTTP(w, r)
// 	})
// }