func bad1() {
    request := gorequest.New()
    // ruleid: gorequest-http-request
    resp, body, errs := request.Get("http://example.com").
        RedirectPolicy(redirectPolicyFunc).
        Set("If-None-Match", `W/"wyzzy"`).
        End()
}

func bad2() {
    request := gorequest.New()
    // ruleid: gorequest-http-request
    resp, body, errs := request.Post("http://example.com").End()
}

func bad3() {
    // ruleid: gorequest-http-request
    resp, body, errs := gorequest.New().Delete("http://example.com/").End()
}

func ok1() {
    // ok: gorequest-http-request
    request := gorequest.New().Proxy("http://proxy:999")
}

func ok2() {
    request := gorequest.New()
    // ok: gorequest-http-request
    resp, body, errs := request.Get("https://example.com").
        RedirectPolicy(redirectPolicyFunc).
        Set("If-None-Match", `W/"wyzzy"`).
        End()
}

func ok3() {
    request := gorequest.New()
    // ok: gorequest-http-request
    resp, body, errs := request.Post("https://example.com").End()
}

func ok4() {
    // ok: gorequest-http-request
    resp, body, errs := gorequest.New().Delete("https://example.com/").End()
}
