pub mod a {
    use md4::{Digest, Md4};

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md4
        let mut mymd4 = Md4::new();
        mymd4.update(a);
        println!("{:#?}", mymd4.finalize());
    }
}

pub mod b {
    use md4::Digest;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md4
        let mut mymd4 = md4::Md4::new();
        mymd4.update(a);
        println!("{:#?}", mymd4.finalize());
    }
}

pub mod c {
    use md4::{Digest, Md4};

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md4
        let mymd4 = Md4::new_with_prefix(a);
        println!("{:#?}", mymd4.finalize());
    }
}

pub mod d {
    use md4::Digest;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md4
        let mymd4 = md4::Md4::new_with_prefix(a);
        println!("{:#?}", mymd4.finalize());
    }
}

pub mod e {
    use md4::Digest;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md4
        let mymd4 = md4::Md4::digest(a);
        println!("{:#?}", mymd4);
    }
}

pub mod f {
    use md4::{Digest, Md4};

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md4
        let mymd4 = Md4::digest(a);
        println!("{:#?}", mymd4);
    }
}
