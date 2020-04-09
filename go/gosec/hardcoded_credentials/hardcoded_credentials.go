package main

import "fmt"

func main1() {
	username := "admin"
	// ruleid: hardcoded-credentials
	password := "f62e5bcda4fae4f82370da0c6f20697b8f8447ef"
	fmt.Println("Doing something with: ", username, password)
}

func main2() {
	username := "admin"
	// ruleid: hardcoded-credentials
	password := "secret"
	fmt.Println("Doing something with: ", username, password)
}

// ruleid: hardcoded-credentials
var password = "f62e5bcda4fae4f82370da0c6f20697b8f8447ef"

func main3() {
	username := "admin"
	fmt.Println("Doing something with: ", username, password)
}

// ruleid: hardcoded-credentials
const cpassword = "f62e5bcda4fae4f82370da0c6f20697b8f8447ef"

func main4() {
	username := "admin"
	fmt.Println("Doing something with: ", username, cpassword)
}

const (
	// ruleid: hardcoded-credentials
	ATNStateTokenStart = "f62e5bcda4fae4f82370da0c6f20697b8f8447ef"
)

func main5() {
	println(ATNStateTokenStart)
}
