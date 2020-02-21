package main
import "fmt"

func main() {
    fmt.Println("hello world")
    var y = 1;    

    if (y) { 
        fmt.Println("of course")
    }

    // ruleid:useless-if-conditional
    if (y) { 
        fmt.Println("of course")
    } else if (y) { 
        fmt.Println("of course other thing")
    }

    // ruleid:useless-if-body
    if (y) {
        fmt.Println("of course")
    } else {
        fmt.Println("of course")
    }
    
}
