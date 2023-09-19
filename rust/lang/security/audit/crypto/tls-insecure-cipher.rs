fn tls_insecure_cipher() {
    //ruleid: tls-with-insecure-cipher
    acceptor
        .set_ciphersuites(
            "TLS_AES_256_GCM_SHA384:TLS_AES_128_GCM_SHA256:TLS_CHACHA20_POLY1305_SHA256",
        )
        .unwrap();
}

fn tls_insecure_cipher_rsa_rc4_sha() {
    //ruleid: tls-with-insecure-cipher
    acceptor
        .set_ciphersuites(
            "TLS_RSA_WITH_RC4_128_SHA:TLS_AES_128_GCM_SHA256:TLS_CHACHA20_POLY1305_SHA256",
        )
        .unwrap();
}

fn tls_insecure_cipher_rsa_acs_128() {
    //ruleid: tls-with-insecure-cipher
    acceptor
        .set_ciphersuites(
            "TLS_RSA_WITH_AES_128_CBC_SHA256:TLS_AES_128_GCM_SHA256:TLS_CHACHA20_POLY1305_SHA256",
        )
        .unwrap();
}

fn tls_insecure_cipher_all() {
    //ruleid: tls-with-insecure-cipher
    acceptor.set_ciphersuites(
        "TLS_RSA_WITH_RC4_128_SHA:TLS_RSA_WITH_AES_128_CBC_SHA256:TLS_RSA_WITH_AES_128_CBC_SHA256:TLS_ECDHE_ECDSA_WITH_RC4_128_SHA:TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256:TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256").unwrap();
}
