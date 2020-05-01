package main

import (
	"crypto/sha1"
	"fmt"
	"os"
)

func main() {
	for _, arg := range os.Args {
		// ruleid: insecure-module-used
		fmt.Printf("%x - %s\n", sha1.Sum([]byte(arg)), arg)
	}
}
