// cf. https://blogtitle.github.io/robn-go-security-pearls-cross-site-scripting-xss/

package main

import (
	"fmt"
	"net/http"
)


func isValid(token string) bool {
	return true
}

func vulnerableHandler(w http.ResponseWriter, r *http.Request) {
  r.ParseForm()
  tok := r.FormValue("token")
  if !isValid(tok) {
    // ruleid:no-io-writestring-to-responsewriter
    io.WriteString(w, Sprintf("Invalid token: %q", tok))
  }
  // ...
}