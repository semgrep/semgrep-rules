fn set_http_cookie() {
    let mut c = Cookie::new("name", "value");
    //ruleid: cookie-set-httponly-false
    c.set_http_only(false);
}

fn build_http_cookie() {
    //ruleid: cookie-build-httponly
    let cookie = Cookie::build("name", "value").http_only(false)
        .domain("www.rust-lang.org")
        .path("/")
        .secure(true)
        .finish();
}
