func bad1() {
    // ruleid: grequests-http-request
    resp, err := grequests.Get("http://httpbin.org/get", nil)
    // You can modify the request by passing an optional RequestOptions struct

    if err != nil {
        log.Fatalln("Unable to make request: ", err)
    }

    fmt.Println(resp.String())
}

func bad2() {
    ro := &RequestOptions{
    Params: map[string]string{"Hello": "Goodbye"},
    }

    // ruleid: grequests-http-request
    Get("http://httpbin.org/get?Hello=World", ro)
}

func ok1() {
    // ok: grequests-http-request
    resp, err := grequests.Get("https://httpbin.org/get", nil)
    // You can modify the request by passing an optional RequestOptions struct

    if err != nil {
        log.Fatalln("Unable to make request: ", err)
    }

    fmt.Println(resp.String())
}

func ok2() {
    ro := &RequestOptions{
    Params: map[string]string{"Hello": "Goodbye"},
    }

    // ok: grequests-http-request
    Get("https://httpbin.org/get?Hello=World", ro)
}
