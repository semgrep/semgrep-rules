func bad1() {
    // ruleid: http-request
    resp, err := http.Get("http://example.com/")
    // ruleid: http-request
    resp, err := http.Post("http://example.com/", val, val)
    // ruleid: http-request
    resp, err := http.Head("http://example.com/")
    // ruleid: http-request
    resp, err := http.PostForm("http://example.com/", form)
}

func bad2() {
    client := &http.Client{
	    CheckRedirect: redirectPolicyFunc,
    }

    // ruleid: http-request
    resp, err := client.Get("http://example.com")
}

func ok1() {
    // ok: http-request
    resp, err := http.Get("https://example.com/")
    // ok: http-request
    resp, err := http.Post("https://example.com/", val, val)
    // ok: http-request
    resp, err := http.Head("https://example.com/")
    // ok: http-request
    resp, err := http.PostForm("https://example.com/", form)
    // ok: http-request
    resp, err := http.PostForm("http://127.0.0.1/", form)
    // ok: http-request
    resp, err := http.Head("http://127.0.0.1/path/to/x")
    // ok: http-request
    resp, err := http.Head("http://localhost/path/to/x")
}

func ok2() {
    client := &http.Client{
	    CheckRedirect: redirectPolicyFunc,
    }

    // ok: http-request
    resp, err := client.Get("https://example.com")

    // ok: http-request
    resp, err := client.Post("https://127.0.0.1/path/to/x", form)

    // ok: http-request
    resp, err := client.Get("https://127.0.0.1")

    // ok: http-request
    resp, err := client.Get("https://localhost/asdf/path")
}
