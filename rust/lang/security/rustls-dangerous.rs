use rustls::{RootCertStore, Certificate, ServerCertVerified, TLSError, ServerCertVerifier};

let verifier = MyServerCertVerifie;

// ok: rustls-dangerous
let mut c1 = rustls::client::ClientConfig::new();

// Remove todo when Rust supports direct module references
// ruleid: rustls-dangerous
let mut c2 = rustls::client::DangerousClientConfig {cfg: &mut cfg};
c2.set_certificate_verifier(verifier);

let mut c3 = rustls::client::ClientConfig::new();
// ruleid: rustls-dangerous
c3.dangerous().set_certificate_verifier(verifier);

// ruleid: rustls-dangerous
let mut c4 = rustls::client::ClientConfig::dangerous(&mut ());
c4.set_certificate_verifier(verifier);
