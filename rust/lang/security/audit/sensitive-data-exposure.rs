use hyper::header::{Headers, SetCookie};
fn main() {
    //ruleid: sensitive-data-exposure
    let a = requests::get("http://example.org/get").unwrap();
    let mut headers = Headers::new();

    headers.set(SetCookie(a));
}

fn main_nowrap() {
    //ruleid: sensitive-data-exposure
    let a = requests::get("http://example.org/get");
    let mut headers = Headers::new();

    headers.set(SetCookie(a));
}


