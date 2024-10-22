fn set_min_version_ssl3() {
    let mut acceptor = SslAcceptor::mozilla_intermediate(SslMethod::tls()).unwrap();
    //ruleid: ssl-v3-is-insecure
    acceptor.set_min_proto_version(Some(SslVersion::SSL3));
}

fn set_min_version_tls1() {
    let mut acceptor = SslAcceptor::mozilla_intermediate(SslMethod::tls()).unwrap();
    //ruleid: tls-v1-is-insecure
    acceptor.set_min_proto_version(Some(SslVersion::TLS1));
}

fn set_min_version_tls1_1() {
    let mut acceptor = SslAcceptor::mozilla_intermediate(SslMethod::tls()).unwrap();
    //ruleid: tls-v1_1-is-insecure
    acceptor.set_min_proto_version(Some(SslVersion::TLS1_1));
}
