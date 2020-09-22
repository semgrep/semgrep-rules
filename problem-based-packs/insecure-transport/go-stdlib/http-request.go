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
    // ruleid: http-request
    client := &http.Client{
	    CheckRedirect: redirectPolicyFunc,
    }

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
}

func ok2() {
    // ok: http-request
    client := &http.Client{
	    CheckRedirect: redirectPolicyFunc,
    }

    resp, err := client.Get("https://example.com")
}

