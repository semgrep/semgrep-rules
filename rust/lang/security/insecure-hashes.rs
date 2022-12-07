use md2::{Md2};
use md4::{Md4};
use md5::{Md5};
use sha1::{Sha1};
use sha2::{Sha256};

// ruleid: insecure-hashes
let mut hasher = Md2::new();

// ruleid: insecure-hashes
let mut hasher = Md4::new();

// ruleid: insecure-hashes
let mut hasher = Md5::new();

// ruleid: insecure-hashes
let mut hasher = Sha1::new();

// ok: insecure-hashes
let mut hasher = Sha256::new();
