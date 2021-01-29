func bad1() {
    params := &Params{Count: 5}

    // ruleid: sling-http-request
    req, err := sling.New().Get("http://example.com").QueryStruct(params).Request()
    client.Do(req)
}

func bad2() {
    const twitterApi = "http://api.twitter.com/1.1/"
    // ruleid: sling-http-request
    base := sling.New().Base(twitterApi).Client(authClient)
}

func bad3() {
    params := &Params{Count: 5}

    sling = sling.New()
    // ruleid: sling-http-request
    req, err := sling.Post("http://example.com").QueryStruct(params).Request()
    client.Do(req)
}

func bad4() {
    s = sling.New()
    const twitterApi = "http://api.twitter.com/1.1/"
    // ruleid: sling-http-request
    base := s.Delete(twitterApi).Client(authClient)
}

func ok1() {
    params := &Params{Count: 5}

    // ok: sling-http-request
    req, err := sling.New().Get("https://example.com").QueryStruct(params).Request()
    client.Do(req)
}

func ok2() {
    const twitterApi = "https://api.twitter.com/1.1/"
    // ok: sling-http-request
    base := sling.New().Base(twitterApi).Client(authClient)
}

func ok3() {
    params := &Params{Count: 5}

    // ok: sling-http-request
    sling = sling.New()
    req, err := sling.Post("https://example.com").QueryStruct(params).Request()
    client.Do(req)
}

func ok4() {
    s = sling.New()
    const twitterApi = "https://api.twitter.com/1.1/"
    // ok: sling-http-request
    base := s.Delete(twitterApi).Client(authClient)
}

func ok5() {
    // Github Issue (abbreviated)
    type Issue struct {
        Title  string `json:"title"`
        Body   string `json:"body"`
    }

    issues := new([]Issue)
    // ok: sling-http-request
    resp, err := githubBase.New().Get(path).QueryStruct(params).ReceiveSuccess(issues)
    fmt.Println(issues, resp, err)
}
