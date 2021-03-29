package main

import (
    "fmt"
    "os"
    "os/exec"
)

func test1(userInput string) {

    cmdPath,_ := userInput;

    // ruleid:dangerous-exec-cmd
    cmd := &exec.Cmd {
        Path: cmdPath,
        Args: []string{ "foo", "bar" },
        Stdout: os.Stdout,
        Stderr: os.Stdout,
    }

    cmd.Start();

}

func test2(userInput string) {

    cmdPath,_ := exec.LookPath("bash");

    // ruleid:dangerous-exec-cmd
    cmd := &exec.Cmd {
        Path: cmdPath,
        Args: []string{ userInput, "bar" },
        Stdout: os.Stdout,
        Stderr: os.Stdout,
    }

    cmd.Start();

}

func okTest1(userInput string) {

    cmdPath,_ := exec.LookPath("go");

    // ok:dangerous-exec-cmd
    cmd := &exec.Cmd {
        Path: cmdPath,
        Args: []string{ cmdPath, "bar" },
        Stdout: os.Stdout,
        Stderr: os.Stdout,
    }

    cmd.Start();

}
