package main

import "syscall"
import "os"
import "os/exec"

func test1(userInput string) {

    binary, lookErr := exec.LookPath(userInput)
    if lookErr != nil {
        panic(lookErr)
    }

    args := []string{"ls", "-a", "-l", "-h"}

    env := os.Environ()

    // ruleid:dangerous-syscall-exec
    execErr := syscall.Exec(binary, args, env)
    if execErr != nil {
        panic(execErr)
    }
}


func test2(userInput string) {

    binary, lookErr := exec.LookPath("sh")
    if lookErr != nil {
        panic(lookErr)
    }

    args := []string{userInput, "-a", "-l", "-h"}

    env := os.Environ()

    // ruleid:dangerous-syscall-exec
    execErr := syscall.Exec(binary, args, env)
    if execErr != nil {
        panic(execErr)
    }
}

func test3(userInput string) {

    binary, lookErr := exec.LookPath("sh")
    if lookErr != nil {
        panic(lookErr)
    }

    args := []string{binary, "-c", userInput}

    env := os.Environ()

    // ruleid:dangerous-syscall-exec
    execErr := syscall.Exec(binary, args, env)
    if execErr != nil {
        panic(execErr)
    }
}



func okTest1(userInput string) {

    binary, lookErr := exec.LookPath("ls")
    if lookErr != nil {
        panic(lookErr)
    }

    args := []string{"ls", "-a", "-l", "-h"}

    env := os.Environ()

    // ok:dangerous-syscall-exec
    execErr := syscall.Exec(binary, args, env)
    if execErr != nil {
        panic(execErr)
    }
}
