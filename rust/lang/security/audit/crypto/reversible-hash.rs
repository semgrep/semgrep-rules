use openssl::hash::MessageDigest;
use openssl::pkey::PKey;
use openssl::rsa::Rsa;
use openssl::sign::Signer;

// Use of unsecure sha1 as MessageDigest
fn reversible_hash_1() {
    //ruleid: reversible-hash
    let msg_digest = MessageDigest::from_name("sha1").unwrap();

    let keypair = PKey::from_rsa(Rsa::generate(2048).unwrap()).unwrap();
    let signer = Signer::new(msg_digest, &keypair).unwrap();
    let signature = signer.sign_to_vec().unwrap();

    println!("signature = {:?}", signature);
}

// Use of unsecure sha1 as MessageDigest
fn reversible_hash_2() {
    //ruleid: reversible-hash
    let msg_digest = MessageDigest::sha1();

    let keypair = PKey::from_rsa(Rsa::generate(2048).unwrap()).unwrap();
    let signer = Signer::new(msg_digest, &keypair).unwrap();
    let signature = signer.sign_to_vec().unwrap();

    println!("signature = {:?}", signature);
}

fn main() {
    reversible_hash_1();
    reversible_hash_2();
}
