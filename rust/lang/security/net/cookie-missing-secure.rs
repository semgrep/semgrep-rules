fn set_http_cookie() {
    let mut c = Cookie::new("name", "value");
    //ruleid: cookie-missing-set_secure
    c.set_secure(false);
}

fn build_http_cookie() {
    //ruleid: cookie-build-secure_false
    let cookie = Cookie::build("name", "value")
        .secure(false)
        .domain("www.rust-lang.org")
        .path("/")
        .http_only(true)
        .finish();
}
