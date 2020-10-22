package main

import (
	"crypto/tls"
	"net/http"
	"os"
)

func bad1() {
    w := os.Stdout

	client := &http.Client{
		Transport: &http.Transport{
			// ruleid: bypass-tls-verification
			TLSClientConfig: &tls.Config{
				KeyLogWriter:       w,
				MinVersion:         tls.VersionSSL30,
				Rand:               randSource{},
				InsecureSkipVerify: true,         // test server certificate is not trusted.
			},
		},
	}

	client_good := &http.Client{
		Transport: &http.Transport{
			// ruleid: bypass-tls-verification
			TLSClientConfig: &tls.Config{
				KeyLogWriter: w,
				// OK
				MinVersion:         tls.VersionTLS10,
				Rand:               randSource{},
				InsecureSkipVerify: true,         // test server certificate is not trusted.
			},
		},
	}

}

func bad2() {
    tr := &http.Transport{
    	// ruleid: bypass-tls-verification
        TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
    }
    client := &http.Client{Transport: tr}
    _, err := client.Get("https://golang.org/")
    if err != nil {
        fmt.Println(err)
    }
}

func bad3() {
	// ruleid: bypass-tls-verification
    http.DefaultTransport.(*http.Transport).TLSClientConfig = &tls.Config{InsecureSkipVerify: true}
    _, err := http.Get("https://golang.org/")
    if err != nil {
        fmt.Println(err)
    }
}

func bad4() {
    // ruleid: bypass-tls-verification
    mTLSConfig := &tls.Config {
    }
    mTLSConfig.PreferServerCipherSuites = true
    mTLSConfig.InsecureSkipVerify = true
}

func ok1() {
    w := os.Stdout

	client := &http.Client{
		Transport: &http.Transport{
			// ok: bypass-tls-verification
			TLSClientConfig: &tls.Config{
				KeyLogWriter:       w,
				MinVersion:         tls.VersionSSL30,
				Rand:               randSource{},
				InsecureSkipVerify: false,         // test server certificate is not trusted.
			},
		},
	}

	client_good := &http.Client{
		Transport: &http.Transport{
			// ok: bypass-tls-verification
			TLSClientConfig: &tls.Config{
				KeyLogWriter: w,
				// OK
				MinVersion:         tls.VersionTLS10,
				Rand:               randSource{},
			},
		},
	}

}

func ok2() {
    tr := &http.Transport{
    	// ok: bypass-tls-verification
        TLSClientConfig: &tls.Config{InsecureSkipVerify: false},
    }
    client := &http.Client{Transport: tr}
    _, err := client.Get("https://golang.org/")
    if err != nil {
        fmt.Println(err)
    }
}

func ok3() {
	// ok: bypass-tls-verification
    http.DefaultTransport.(*http.Transport).TLSClientConfig = &tls.Config{InsecureSkipVerify: false}
    _, err := http.Get("https://golang.org/")
    if err != nil {
        fmt.Println(err)
    }
}

func ok4() {
    // ok: bypass-tls-verification
    mTLSConfig := &tls.Config {
    }
    mTLSConfig.PreferServerCipherSuites = true
    mTLSConfig.InsecureSkipVerify = false
}
