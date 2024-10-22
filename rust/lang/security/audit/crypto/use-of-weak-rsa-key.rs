//id: use-of-weak-rsa-key
fn main() {
    //ruleid: use-of-weak-rsa-key
    let pvk = openssl::rsa::Rsa::generate(1024);
    use openssl::rsa::Rsa;
    //ruleid: use-of-weak-rsa-key
    let pvk = Rsa::generate(1024);
}
