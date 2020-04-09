package main

import "fmt"

func main1() {
	username := "admin"
	password := "f62e5bcda4fae4f82370da0c6f20697b8f8447ef"
	fmt.Println("Doing something with: ", username, password)
}

func main2() {
	username := "admin"
	password := "secret"
	fmt.Println("Doing something with: ", username, password)
}

var password = "f62e5bcda4fae4f82370da0c6f20697b8f8447ef"

func main3() {
	username := "admin"
	fmt.Println("Doing something with: ", username, password)
}

const cpassword = "f62e5bcda4fae4f82370da0c6f20697b8f8447ef"

func main4() {
	username := "admin"
	fmt.Println("Doing something with: ", username, cpassword)
}

const (
	ATNStateTokenStart = "f62e5bcda4fae4f82370da0c6f20697b8f8447ef"
)

func main5() {
	println(ATNStateTokenStart)
}
