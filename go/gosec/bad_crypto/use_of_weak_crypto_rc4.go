package main

import (
	"crypto/rc4"
)

func main() {
	key := []byte{1, 2, 3, 4, 5, 6, 7}
	// ruleid: use-of-rc4
	c, err := rc4.NewCipher(key)
	dst := make([]byte, len(src))
	c.XORKeyStream(dst, src)
}
