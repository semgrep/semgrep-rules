pub mod a {
    use md2::Digest;
    use sha1::Sha1;
    pub fn ex() {
        //ruleid: use-of-sha1
        let _ = Sha1::new();
    }
}

pub mod b {
    use md2::Digest;
    pub fn ex() {
        //ruleid: use-of-sha1
        let _ = sha1::Sha1::new();
    }
}

pub mod c {
    pub fn ex() {
        //ruleid: use-of-sha1
        let _ = openssl::sha::sha1(b"some_bytes");
    }
}

pub mod d {
    use openssl::sha;
    pub fn ex() {
        //ruleid: use-of-sha1
        let _ = sha::sha1(b"some_bytes");
    }
}

pub mod e {
    use openssl::sha::sha1;
    pub fn ex() {
        //ruleid: use-of-sha1
        let _ = sha1(b"some_bytes");
    }
}
