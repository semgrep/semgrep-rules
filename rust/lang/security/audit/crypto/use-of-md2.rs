pub mod a {
    use md2::{Digest, Md2};

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md2
        let mut mymd2 = Md2::new();
        mymd2.update(a);
        println!("{:#?}", mymd2.finalize());
    }
}

pub mod b {
    use md2::Digest;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md2
        let mut mymd2 = md2::Md2::new();
        mymd2.update(a);
        println!("{:#?}", mymd2.finalize());
    }
}

pub mod c {
    use md2::{Digest, Md2};

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md2
        let mymd2 = Md2::new_with_prefix(a);
        println!("{:#?}", mymd2.finalize());
    }
}

pub mod d {
    use md2::Digest;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md2
        let mymd2 = md2::Md2::new_with_prefix(a);
        println!("{:#?}", mymd2.finalize());
    }
}

pub mod e {
    use md2::Digest;

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md2
        let mymd2 = md2::Md2::digest(a);
        println!("{:#?}", mymd2);
    }
}

pub mod f {
    use md2::{Digest, Md2};

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-md2
        let mymd2 = Md2::digest(a);
        println!("{:#?}", mymd2);
    }
}
