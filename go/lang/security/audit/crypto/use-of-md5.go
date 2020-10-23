package main

import (
	"crypto/md5"
	"fmt"
	"io"
	"log"
	"os"
)

func main() {
}

func test_md5() {
	f, err := os.Open("file.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()

	defer func() {
		err := f.Close()
		if err != nil {
			log.Printf("error closing the file: %s", err)
		}
	}()

	// ruleid: use-of-md5
	h := md5.New()
	if _, err := io.Copy(h, f); err != nil {
		log.Fatal(err)
	}
	// ruleid: use-of-md5
	fmt.Printf("%x", md5.Sum(nil))
}