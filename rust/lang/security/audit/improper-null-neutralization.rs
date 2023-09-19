use std::ffi::{CStr, CString};
use std::os::raw::c_char;

extern "C" {
    fn get_c_string() -> *const c_char;
}

fn main() {
    let nul_escape_char = '\0';
    let nul_unicode_char = '\u{0000}';

    unsafe {
        // ruleid: improper-null-neutralization
        let slice = CStr::from_ptr(get_c_string());
        let unknown_nul_terminated = slice.to_str().unwrap();
        slice.to_str().unwrap();
    }

    unsafe {
        // ruleid: improper-null-neutralization
        let cstr = CStr::from_ptr(get_c_string()).to_bytes();
        let not_null_terminated = CStr::from_bytes_with_nul_unchecked(cstr);
        CStr::from_bytes_with_nul_unchecked(cstr);
    }

    unsafe {
        // ruleid: improper-null-neutralization
        let cstr = CStr::from_ptr(get_c_string()).to_bytes();
        let not_null_terminated = CStr::from_bytes_with_nul_unchecked(cstr);
        let str = CStr::from_bytes_with_nul_unchecked(cstr);
    }

    unsafe {
        // ruleid: improper-null-neutralization
        let slice = CStr::from_ptr(get_c_string());
        let unknown_nul_terminated = slice.to_str().unwrap();
        let unknown = slice.to_str().unwrap();
    }

    unsafe {
        // ok: improper-null-neutralization
        let cstr = CStr::from_ptr(get_c_string());
        let null_terminated = CStr::from_bytes_with_nul(cstr);
        CStr::from_bytes_with_nul(cstr);
    }
}
