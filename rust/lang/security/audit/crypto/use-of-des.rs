// Simplest to just block the import of `des` as its interface has changed quite a bit from 0.0.1 to current
pub mod a {
    #[allow(unused_imports)]
    //ruleid: use-of-DES
    use des;
}

pub mod b {
    #[allow(unused_imports)]
    //ruleid: use-of-DES
    use des::Des;
}