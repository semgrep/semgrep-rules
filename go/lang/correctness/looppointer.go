func() {
    values := []string{"a", "b", "c"}
    var funcs []func()
    // ruleid:exported_loop_pointer
    for _, val := range values {
        funcs = append(funcs, func() {
            fmt.Println(&val)
        })
    }
}

func() {
    // ruleid:exported_loop_pointer
    for _, val := range values {
        print_pointer(val)
    }
}


func() {
    values := []string{"a", "b", "c"}
    var funcs []func()
    // ok:exported_loop_pointer
    for _, val := range values {
        val := val // pin!
        funcs = append(funcs, func() {
            fmt.Println(&val)
        })
    }
}
