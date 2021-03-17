package main

import (
    "fmt"
    "os"
    "os/exec"
)

func runCommand1(userInput string) {
  // ruleid:dangerous-exec-command
  cmd := exec.Command( userInput, "foobar" )

  cmd.Stdout = os.Stdout
  cmd.Stderr = os.Stdout

  if err := cmd.Run(); err != nil {
      fmt.Println( "Error:", err )
  }

}

func runCommand2(userInput string) {

    execPath,_ := exec.LookPath(userInput)

    // ruleid:dangerous-exec-command
    cmd := exec.Command( execPath, "foobar" )

    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stdout

    if err := cmd.Run(); err != nil {
        fmt.Println( "Error:", err )
    }

}

func okCommand1(userInput string) {

    goExec,_ := exec.LookPath("go")

    // ok:dangerous-exec-command
    cmd := exec.Command( goExec, "version" )

    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stdout

    if err := cmd.Run(); err != nil {
        fmt.Println( "Error:", err )
    }

}

func runCommand1(userInput string) {
    // ok:dangerous-exec-command
    cmd := exec.Command( "go", "version" )

    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stdout

    if err := cmd.Run(); err != nil {
        fmt.Println( "Error:", err )
    }

}
