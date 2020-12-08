func bad1() {
    // ruleid: http-customized-request
    req, err := http.NewRequest("GET", "http://example.com", nil)
}

func ok1() {
    // ok: http-customized-request
    req, err := http.NewRequest("GET", "https://example.com", nil)
}
