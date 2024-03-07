use std::fs::OpenOptions;
use std::os::unix::fs::*;


fn main() {
    //ruleid: incorrect-permission-assignment
    OpenOptions::new().mode(0777).open("somefile");
    //ruleid: incorrect-permission-assignment
    OpenOptions::new().mode(0772).open("somefile");
    //ruleid: incorrect-permission-assignment
    OpenOptions::new().mode(0776).open("somefile");
    //ok: incorrect-permission-assignment
    OpenOptions::new().mode(0771).open("somefile");
}
