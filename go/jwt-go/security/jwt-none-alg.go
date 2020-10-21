package main

import (
    "fmt"
    "github.com/dgrijalva/jwt-go"
)

func bad1() {
    claims := jwt.StandardClaims{
        ExpiresAt: 15000,
        Issuer:    "test",
    }

    // ruleid: jwt-go-none-algorithm
    token := jwt.NewWithClaims(jwt.SigningMethodNone, claims)
    // ruleid: jwt-go-none-algorithm
    ss, err := token.SignedString(jwt.UnsafeAllowNoneSignatureType)
    fmt.Printf("%v %v\n", ss, err)
}

func ok1(key []byte) {
    claims := jwt.StandardClaims{
        ExpiresAt: 15000,
        Issuer:    "test",
    }

    // ok: jwt-go-none-algorithm
    token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
    ss, err := token.SignedString(key)
    fmt.Printf("%v %v\n", ss, err)
}
