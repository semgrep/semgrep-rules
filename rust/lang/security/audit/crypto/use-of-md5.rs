pub mod a {
    use md5;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md5
        let mut mymd5 = md5::Context::new();
        mymd5.consume(a);
        println!("{:#?}", mymd5.compute());
    }
}

pub mod b {
    use md5::Digest;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ok: use-of-md5
        let mymd4 = Digest(a);
        println!("{:#?}", mymd4);
    }
}

pub mod c {
    use md5::{Context, Digest};

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md5
        let mut mein = Context::new();
        let _ = Digest(a);
        mein.consume(a);
        println!("{:#?}", mein.compute());
    }
}

pub mod d {
    use md5::Context;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md5
        let mut mein = Context::new();
        mein.consume(a);
        println!("{:#?}", mein.compute());
    }
}

pub mod e {
    use md5::*;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md5
        let _ = compute(a);
        // The following should be supported by semgrep but isn't presently
        //todoruleid: use-of-md5
        println!("{:#?}", compute(a));
    }
}

pub mod f {
    use md5;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md5
        let _ = md5::compute(a);
        // The following should be supported by semgrep but isn't presently
        //todoruleid: use-of-md5
        println!("{:#?}", md5::compute(a));
    }
}
