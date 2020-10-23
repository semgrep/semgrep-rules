package main
import "fmt"

func main() {
    fmt.Println("hello world")

    // ruleid:hardcoded-eq-true-or-false
    if (false) {
        fmt.Println("never")
    }
}
