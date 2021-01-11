package main
import "fmt"

func main() {
    fmt.Println("hello world")
    var y = "hello";
    // ruleid:eqeq-is-bad
    fmt.Println(y == y)
    // ok:eqeq-is-bad
    assert(y == y)

    // ruleid:hardcoded-eq-true-or-false
    if (false) {
        fmt.Println("never")
    }
}
