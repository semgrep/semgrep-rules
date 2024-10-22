use libxml::bindings::xmlParserOption_XML_PARSE_DTDLOAD;
use libxml::bindings::xmlReadFile;
use std::env;
use std::ffi::CString;
use std::os::raw::c_char;
use std::path::PathBuf;

// This example was created referencing the following documentation:
// https://cheatsheetseries.owasp.org/cheatsheets/XML_External_Entity_Prevention_Cheat_Sheet.html
//
// This document explains how XML entity injection works, and which features in
// popular xml parsing libraries create  XXE vulnerabilities. This
// example calls into libxml2 (C library) via a FFI binding layer in Rust,
// and attempts to use features which risk an XXE.

fn main() {
    let home = env::var("HOME").expect("Env Var $HOME not set");
    let mut path = PathBuf::from(home);
    path.push("test.xml");

    let c_str = CString::new(path.to_str().unwrap()).unwrap();

    unsafe {
        //ruleid: xml-entity-injection
        let _ptr = xmlReadFile(
            c_str.as_ptr() as *const c_char,
            std::ptr::null(),
            //ruleid: xml-entity-injection
            xmlParserOption_XML_PARSE_DTDLOAD as i32,
        );
    }
}
