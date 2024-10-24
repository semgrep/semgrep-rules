package main

import (
	"crypto/rand"
	// ruleid: math-random-used
	mrand "math/rand"
	// ruleid: math-random-used
	mrand "math/rand/v2"
	// ruleid: math-random-used
	mrand "math/rand/v222"
	// ok: math-random-used
	mrand "math/rand/something"
)

func main() {
	main0()
	main1()
	main2()
	main3()
}

func main0() {
	// ok: math-random-used
	bad, _ := mrand.Read(nil)
	println(bad)
}

func main1() {
	// ok: math-random-used
	good, _ := rand.Read(nil)
	println(good)
}

func main2() {
	// ok: math-random-used
	bad := mrand.Int()
	println(bad)
}

func main3() {
	// ok: math-random-used
	good, _ := rand.Read(nil)
	println(good)
	i := mrand.Int31()
	println(i)
}
