package insecuregrpc

import (
	"crypto/x509"
	"log"
	"net/http"
	"net/http/httptest"

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
	// ok:grpc-server-insecure-connection
	s := grpc.NewServer(grpc.Creds(credentials.NewClientTLSFromCert(x509.NewCertPool(), "")))
	// ... register gRPC services ...
	if err = s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}

// False Positive test
// cf. https://github.com/daghan/invoicer-chapter2/blob/4c5b00408a4aeece86d98ad3ef1c88e610053dfc/vendor/golang.org/x/net/websocket/websocket_test.go#L129
func startServer() {
	http.Handle("/echo", Handler(echoServer))
	http.Handle("/count", Handler(countServer))
	http.Handle("/ctrldata", Handler(ctrlAndDataServer))
	subproto := Server{
		Handshake: subProtocolHandshake,
		Handler:   Handler(subProtoServer),
	}
	http.Handle("/subproto", subproto)
	// ok:grpc-server-insecure-connection
	server := httptest.NewServer(nil)
	serverAddr = server.Listener.Addr().String()
	log.Print("Test WebSocket server listening on ", serverAddr)
}

// False Positive test - options have grpc.Creds
func startServerWithOpts() {
	options := []grpc.ServerOption{
		grpc.Creds(credentials.NewClientTLSFromCert(pool, addr)),
	}
	// ok:grpc-server-insecure-connection
	grpcServer := grpc.NewServer(options...)
	_ = grpcServer
}

// False Positive test - options have grpc.Creds, credentials in a variable
func startServerCredsVar() {
	creds := credentials.NewClientTLSFromCert(xpool, xaddr)
	options := []grpc.ServerOption{
		grpc.Creds(creds),
		grpc.UnaryInterceptor(auth.GRPCInterceptor),
	}
	// ok:grpc-server-insecure-connection
	grpcServer := grpc.NewServer(options...)
	_ = grpcServer
}

func startServerWithOtherCreds() {
    creds := credentials.NewTLS(tlsConfig)
	logger := penglog.GlobalLogger()
	logInterceptor := penggrpc.NewAccessLogInterceptor(&logger, grpcLogFields)
	opts := []grpc.ServerOption{
		grpc.Creds(creds),
		grpc.ChainUnaryInterceptor(
			logInterceptor.UnaryServerInterceptor,
			auth.GRPCInterceptor,
		),
		grpc.MaxRecvMsgSize(maxRecvMsgSize),
	}
	// ok:grpc-server-insecure-connection
	grpcServer := grpc.NewServer(opts)
	_ = grpcServer
}

