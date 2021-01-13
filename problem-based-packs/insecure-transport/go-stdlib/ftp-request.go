func bad1() {
    // ruleid: ftp-request
    ftp.Dial("ftp://example.com", ftp.DialWithTimeout(5*time.Second))
}

func bad2() {
    // ruleid: ftp-request
    ftp.DialTimeout("ftp://example.com", 5*time.Second)
}

func bad3() {
    // ruleid: ftp-request
    ftp.Connect("ftp://example.com")
}

func bad4() {
    // ruleid: ftp-request
    url = "ftp://example.com"
    // ruleid: ftp-request
    ftp.Dial(url, ftp.DialWithTimeout(5*time.Second))
}

func bad5() {
    // ruleid: ftp-request
    url = "ftp://example.com"
    // ruleid: ftp-request
    ftp.DialTimeout(url, 5*time.Second)
}

func bad6() {
    // ruleid: ftp-request
    url = "ftp://example.com"
    // ruleid: ftp-request
    ftp.Connect(url)
}

func ok1() {
    // ok: ftp-request
    ftp.Dial("sftp://example.com", ftp.DialWithTimeout(5*time.Second))
}

func ok2() {
    // ok: ftp-request
    ftp.DialTimeout("sftp://example.com", 5*time.Second)
}

func ok3() {
    // ok: ftp-request
    ftp.Connect("sftp://example.com")
}

func ok4() {
    // ok: ftp-request
    url = "sftp://example.com"
    ftp.Dial(url, ftp.DialWithTimeout(5*time.Second))
}

func ok5() {
    // ok: ftp-request
    url = "sftp://example.com"
    ftp.DialTimeout(url, 5*time.Second)
}

func ok6() {
    // ok: ftp-request
    url = "sftp://example.com"
    ftp.Connect(url)
}
