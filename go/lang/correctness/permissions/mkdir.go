package main

import (
	"fmt"
	"os"
)

func main() {
	// ruleid: incorrect-default-permission
	err := os.Mkdir("/tmp/mydir", 0777)
	if err != nil {
		fmt.Println("Error when creating a directory!")
		return
	}

	// ruleid: incorrect-default-permission
	err := os.MkdirAll("/tmp/mydir", 0777)
	if err != nil {
		fmt.Println("Error when creating a directory!")
		return
	}

	// ok
	err := os.MkdirAll("/tmp/mydir", 0600)
	if err != nil {
		fmt.Println("Error when creating a directory!")
		return
	}
}
