//id: use-of-weak-rsa-key
fn main() {
    //todoruleid: use-of-weak-rsa-key
    let pvk = openssl::rsa::Rsa::generate(1024);
    use openssl::rsa::Rsa;
    //todoruleid: use-of-weak-rsa-key
    let pvk = Rsa::generate(1024);
}
