package main

import (
	"fmt"
	"os"
)

func main() {
	// ruleid: incorrect-default-permission
	err := os.Chmod("/tmp/somefile", 0777)
	if err != nil {
		fmt.Println("Error when changing file permissions!")
		return
	}
}

func main1() {
	// ok
	err := os.Chmod("/tmp/somefile", 0400)
	if err != nil {
		fmt.Println("Error when changing file permissions!")
		return
	}
}
