package insecuregrpc

import (
    "crypto/x509"

    "google.golang.org/grpc"
    "google.golang.org/grpc/credentials"
)

// cf. https://blog.gopheracademy.com/advent-2019/go-grps-and-tls/#connection-without-encryption
func unsafe() {
    // Server
    // ruleid:grpc-server-insecure-connection
    s := grpc.NewServer()
    // ... register gRPC services ...
    if err = s.Serve(lis); err != nil {
        log.Fatalf("failed to serve: %v", err)
    }
}

func safe() {
    // Server
    // ok
    s := grpc.NewServer(grpc.Creds(credentials.NewClientTLSFromCert(x509.NewCertPool(), "")))
    // ... register gRPC services ...
    if err = s.Serve(lis); err != nil {
        log.Fatalf("failed to serve: %v", err)
    }
}