package main

import (
	"crypto/tls"
	"log"
	"net/http"
	"net/http/httptest"
	"os"
)

// zeroSource is an io.Reader that returns an unlimited number of zero bytes.
type zeroSource struct{}

func (zeroSource) Read(b []byte) (n int, err error) {
	for i := range b {
		b[i] = 0
	}

	return len(b), nil
}

func main() {
	// Dummy test HTTP server for the example with insecure random so output is
	// reproducible.
	server := httptest.NewUnstartedServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {}))
	// ruleid: missing-ssl-minversion
	server.TLS = &tls.Config{ Rand: zeroSource{}, MinVersion: tls.VersionTLS13 }
	server.StartTLS()
	defer server.Close()

	// Typically the log would go to an open file:
	// w, err := os.OpenFile("tls-secrets.txt", os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0600)
	w := os.Stdout

	client := &http.Client{
		Transport: &http.Transport{
			// ok: missing-ssl-minversion
			TLSClientConfig: &tls.Config{
				KeyLogWriter:       w,
				MinVersion:         tls.VersionSSL30,
				Rand:               zeroSource{}, // for reproducible output; don't do this.
				InsecureSkipVerify: true,         // test server certificate is not trusted.
			},
		},
	}
	resp, err := client.Get(server.URL)
	if err != nil {
		log.Fatalf("Failed to get URL: %v", err)
	}
	resp.Body.Close()

	clientGood := &http.Client{
		Transport: &http.Transport{
			// ok: missing-ssl-minversion
			TLSClientConfig: &tls.Config{
				KeyLogWriter: w,
				MinVersion:         tls.VersionTLS10,
				Rand:               zeroSource{}, // for reproducible output; don't do this.
				InsecureSkipVerify: true,         // test server certificate is not trusted.
			},
		},
	}
	resp, err := client.Get(server.URL)
	if err != nil {
		log.Fatalf("Failed to get URL: %v", err)
	}
	resp.Body.Close()
}
