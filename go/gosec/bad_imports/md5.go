package main

import (
	"crypto/md5"
	"fmt"
	"os"
)

func main() {
	for _, arg := range os.Args {
		// ruleid: insecure-module-used
		fmt.Printf("%x - %s\n", md5.Sum([]byte(arg)), arg)
	}
}
