pub mod a {
    use rc4::KeyInit;
    use rc4::Rc4;

    pub fn ex() {
        //ruleid: use-of-rc4
        let _ = Rc4::new(b"key".into());
    }
}

pub mod b {
    use rc4::Rc4;
    use rc4::{consts::*, KeyInit};

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-rc4
        let _ = Rc4::<U6>::new_from_slice(&a);
    }
}

pub mod c {
    use rc4;
    use rc4::KeyInit;

    pub fn ex() {
        //ruleid: use-of-rc4
        let _ = rc4::Rc4::new(b"key".into());
    }
}

pub mod d {
    use rc4;
    use rc4::{consts::*, KeyInit};

    pub fn ex() {
        let a: [u8; 16] = [0; 16];
        //ruleid: use-of-rc4
        let _ = rc4::Rc4::<U6>::new_from_slice(&a);
    }
}
