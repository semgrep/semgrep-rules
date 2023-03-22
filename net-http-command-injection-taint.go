package main

import (
    "fmt"
    "os/exec"
    "io"
    "os"
    "net/http"
)

type App struct{}

func (a *App) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	w.WriteHeader(http.StatusOK)

	io.WriteString(w, "Hello world\n")

    username, _, _ := r.BasicAuth()

    fmt.Printf("username: %s\n\n", username)

    fmt.Printf("Path Sink:\n")
    cmd := &exec.Cmd {
        // Path is the path of the command to run.
        // ruleid: net-http-command-injection-taint
        Path: username,
        // Args holds command line arguments, including the command as Args[0].
        Args: []string{ "tr", "--help" },
        Stdout: os.Stdout,
        Stderr: os.Stderr,
    }

    cmd.Start()
    cmd.Wait()
    fmt.Printf("\n")

    fmt.Printf("Args Sink:\n")
    cmd2 := &exec.Cmd {
        // Path is the path of the command to run.
        Path: "/usr/bin/tr",
        // Args holds command line arguments, including the command as Args[0].
        // ruleid: net-http-command-injection-taint
        Args: []string{ username, "--help" },
        Stdout: os.Stdout,
        Stderr: os.Stderr,
    }
    cmd2.Start()
    cmd2.Wait()

    // ok: net-http-command-injection-taint
    cmd3 := exec.Command("bash")
    cmd3Writer, _ := cmd3.StdinPipe()
    cmd3.Start()
    cmd3Input := fmt.Sprintf("ls %s", username)

    // ruleid: net-http-command-injection-taint
    cmd3Writer.Write([]byte(cmd3Input + "\n"))

    // ruleid: net-http-command-injection-taint
    io.WriteString(cmd3Writer, cmd3Input)

    cmd3.Wait()

    // ruleid: net-http-command-injection-taint
    syscall.Exec(username, []string{"-a", "-l", "-h"})
}

func main() {
    http.ListenAndServe(":9000", &App{})
}
