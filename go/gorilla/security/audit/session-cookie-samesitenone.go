package main

import (
    "net/http"
    "github.com/gorilla/sessions"
)

var store = sessions.NewCookieStore([]byte(""))

func setSessionWithSameSiteNone(w http.ResponseWriter, r *http.Request) {
    session, _ := store.Get(r, "session-name")
    // ruleid: session-cookie-samesitenone
    session.Options = &sessions.Options{
        Path:     "/",
        MaxAge:   3600,
        HttpOnly: true,
        Secure:   true,
        SameSite: http.SameSiteNoneMode,
    }
    session.Save(r, w)
}

func setSessionWithSameSiteStrict(w http.ResponseWriter, r *http.Request) {
    session, _ := store.Get(r, "session-name")
    // ok: session-cookie-samesitenone
    session.Options = &sessions.Options{
        Path:     "/",
        MaxAge:   3600,
        HttpOnly: true,
        Secure:   true,
        SameSite: http.SameSiteStrictMode,
    }
    session.Save(r, w)
}

func main() {
    http.HandleFunc("/set-none", setSessionWithSameSiteNone)
    http.HandleFunc("/set-strict", setSessionWithSameSiteStrict)
    http.ListenAndServe(":8080", nil)
}
