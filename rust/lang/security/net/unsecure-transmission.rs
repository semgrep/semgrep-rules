use reqwest;
use reqwest::blocking::Client;

fn unsecure() {
    // ruleid: unsecure-transmission
    let client = Client::builder()
        .danger_accept_invalid_hostnames(true)
        .build()
        .unwrap();
    let res = client.get("http://www.google.com").send().unwrap();

    println!("res: is {}", res.status());
}

fn secure() {
    // ok: unsecure-transmission
    let client = Client::builder().build().unwrap();
    let res = client.get("http://www.google.com").send().unwrap();

    println!("res: is {}", res.status());
}

fn main() {
    unsecure();
    secure();
}
