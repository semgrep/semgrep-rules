package main

import (
	"crypto/sha256"
	"golang.org/x/crypto/sha3"
	"fmt"
	"io"
	"log"
	"os"
)

func main() {
}

func test_sha224() {
	f, err := os.Open("file.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	// ruleid: sha224-hash
	h := sha256.New224()
	if _, err := io.Copy(h, f); err != nil {
		log.Fatal(err)
	}
	// ruleid: sha224-hash
	fmt.Printf("%x", sha256.Sum224(nil))
}

func test_sha3_224() {
	f, err := os.Open("file.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	// ruleid: sha224-hash
	h := sha3.New224()
	if _, err := io.Copy(h, f); err != nil {
		log.Fatal(err)
	}
	// ruleid: sha224-hash
	fmt.Printf("%x", sha3.Sum224(nil))
}