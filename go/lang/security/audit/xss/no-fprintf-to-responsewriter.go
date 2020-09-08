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
    // ruleid:no-fprintf-to-responsewriter
    fmt.Fprintf(w, "Invalid token: %q", tok)
  }
  // ...
}