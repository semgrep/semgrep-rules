package main

import (
	"crypto/rc4"
	"encoding/hex"
	"fmt"
)

func main() {
	// ruleid: insecure-module-used
	cipher, err := rc4.NewCipher([]byte("sekritz"))
	if err != nil {
		panic(err)
	}
	plaintext := []byte("I CAN HAZ SEKRIT MSG PLZ")
	ciphertext := make([]byte, len(plaintext))
	cipher.XORKeyStream(ciphertext, plaintext)
	fmt.Println("Secret message is: %s", hex.EncodeToString(ciphertext))
}
