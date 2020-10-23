package main

import (
	"crypto/sha1"
	"fmt"
	"io"
	"log"
	"os"
)

func main() {
}

func test_sha1() {
	f, err := os.Open("file.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	// ruleid: use-of-sha1
	h := sha1.New()
	if _, err := io.Copy(h, f); err != nil {
		log.Fatal(err)
	}
	// ruleid: use-of-sha1
	fmt.Printf("%x", sha1.Sum(nil))
}
