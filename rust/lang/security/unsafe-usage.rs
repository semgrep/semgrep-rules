// ruleid: unsafe-usage
let pid = unsafe { libc::getpid() as u32 };

// ok: unsafe-usage
let pid = libc::getpid() as u32;
