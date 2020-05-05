package main

import (
	"golang.org/x/crypto/ssh"
)

func main() {
	// ruleid: avoid-ssh-insecure-ignore-host-key
	_ = ssh.InsecureIgnoreHostKey()
}
