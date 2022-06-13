package main

import (
    "crypto/tls"
    "fmt"
    "net/http"
)

func connect() {
    Conn.Password = Config.Password
    Conn.UseTLS = Config.UseTLS
    Conn.TLSConfig = &tls.Config {
        ServerName: getServerName(),

        // ruleid: tls-insecure-skip-verify
        InsecureSkipVerify: true,
    }
    Conn.VerboseCallbackHandler = Config.Debug
    err := Conn.Connect(Config.Server)
    if err != nil {
        log.Fatal(err)
    }
}

func connect1() {
    Conn.Password = Config.Password
    Conn.UseTLS = Config.UseTLS
    Conn.TLSConfig = &tls.Config {
        ServerName: getServerName(),
        VerifyConnection: func(cs tls.ConnectionState) error {
			opts := x509.VerifyOptions{
				DNSName:       cs.ServerName,
				Intermediates: x509.NewCertPool(),
			}
			for _, cert := range cs.PeerCertificates[1:] {
				opts.Intermediates.AddCert(cert)
			}
			_, err := cs.PeerCertificates[0].Verify(opts)
			return err
		},
        // ok
        InsecureSkipVerify: true,
    }
    Conn.VerboseCallbackHandler = Config.Debug
    err := Conn.Connect(Config.Server)
    if err != nil {
        log.Fatal(err)
    }
}
