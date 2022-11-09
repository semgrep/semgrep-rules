package main

import (
	"context"
	"fmt"
	"os"
	"os/exec"
	"time"
)

func runCommand1(userInput string) {
	// ruleid:dangerous-exec-command
	cmd := exec.Command(userInput, "foobar")

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stdout

	if err := cmd.Run(); err != nil {
		fmt.Println("Error:", err)
	}

}

func runCommand2(userInput string) {

	execPath, _ := exec.LookPath(userInput)

	// ruleid:dangerous-exec-command
	cmd := exec.Command(execPath, "foobar")

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stdout

	if err := cmd.Run(); err != nil {
		fmt.Println("Error:", err)
	}

}

func runCommand3(userInput string) {
	ctx, cancel := context.WithTimeout(context.Background(), 100*time.Millisecond)
	defer cancel()

	// ruleid:dangerous-exec-command
	if err := exec.CommandContext(ctx, userInput, "5").Run(); err != nil {
		fmt.Println("Error:", err)
	}

}

func runCommand4(userInput string) {

	// ruleid:dangerous-exec-command
	cmd := exec.Command("bash", "-c", userInput)

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stdout

	if err := cmd.Run(); err != nil {
		fmt.Println("Error:", err)
	}

}

func runcommand5(s string) (string, error) {

	// ruleid:dangerous-exec-command
	cmd := exec.Command("/usr/bin/env", "bash", "-c", s)
	stdoutStderr, err := cmd.CombinedOutput()

	if err != nil {
		return "", fmt.Errorf("shellCommand: unexpected error: out = %s, error = %v", stdoutStderr, err)
	}

	return string(stdoutStderr), nil
}

func runcommand6(s string) (string, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 100*time.Millisecond)
	// might not have user context
	// ruleid:dangerous-exec-command
	cmd := exec.CommandContext(ctx, "/bin/env", "bash", "-c", s)
	stdoutStderr, err := cmd.CombinedOutput()

	if err != nil {
		return "", fmt.Errorf("shellCommand: unexpected error: out = %s, error = %v", stdoutStderr, err)
	}

	return string(stdoutStderr), nil
}

func okCommand1(userInput string) {

	goExec, _ := exec.LookPath("go")

	// ok:dangerous-exec-command
	cmd := exec.Command(goExec, "version")

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stdout

	if err := cmd.Run(); err != nil {
		fmt.Println("Error:", err)
	}

}

func okCommand2(userInput string) {
	// ok:dangerous-exec-command
	cmd := exec.Command("go", "version")

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stdout

	if err := cmd.Run(); err != nil {
		fmt.Println("Error:", err)
	}

}

func okCommand3(s string) (string, error) {

	someCommand := "w"
	// ok:dangerous-exec-command
	cmd := exec.Command("/usr/bin/env", "bash", "-c", someCommand)
	stdoutStderr, err := cmd.CombinedOutput()

	if err != nil {
		return "", fmt.Errorf("shellCommand: unexpected error: out = %s, error = %v", stdoutStderr, err)
	}

	return string(stdoutStderr), nil
}
