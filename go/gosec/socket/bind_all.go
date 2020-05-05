package main

import (
	"log"
	"net"
)

func main() {
	// ruleid: avoid-bind-to-all-interfaces
	l, err := net.Listen("tcp", "0.0.0.0:2000")
	if err != nil {
		log.Fatal(err)
	}
	defer l.Close()
}
