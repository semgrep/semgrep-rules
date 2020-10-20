package main

import "fmt"

// ruleid: hidden-goroutine
func HiddenGoroutine() {
    go func() {
        fmt.Println("hello world")
    }()
}

// ok: hidden-goroutine
func FunctionThatCallsGoroutineIsOk() {
    fmt.Println("This is normal")
    go func() {
        fmt.Println("This is OK because the function does other things")
    }()
}

// ok: hidden-goroutine
func FunctionThatCallsGoroutineAlsoOk() {
    go func() {
        fmt.Println("This is OK because the function does other things")
    }()
    fmt.Println("This is normal")
}
