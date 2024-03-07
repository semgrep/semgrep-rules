use std::env;
use std::error::Error;
use std::fs;
use std::path::PathBuf;

fn list_user_dir() -> Result<(), Box<dyn Error>> {
    //ok: exposure-dir-listing
    for f in fs::read_dir("~/Documents")? {
        println!("{:?}", f?.path());
    }

    Ok(())
}

// Not-ok access system dir
fn list_system_dir() -> Result<(), Box<dyn Error>> {
    //ruleid: exposure-dir-listing
    for f in fs::read_dir("/sbin")? {
        println!("{:?}", f?.path());
    }

    Ok(())
}

// Directory with implied sensitive contents
fn list_sensitive_dir() -> Result<(), Box<dyn Error>> {
    //ruleid: exposure-dir-listing
    for f in fs::read_dir("~/passwords")? {
        println!("{:?}", f?.path());
    }

    Ok(())
}

fn list_bin_dir() -> Result<(), Box<dyn Error>> {
    //ruleid: exposure-dir-listing
    for f in fs::read_dir("/bin")? {
        println!("{:?}", f?.path());
    }

    Ok(())
}

fn list_sensitive_dir() -> Result<(), Box<dyn Error>> {
    //ruleid: exposure-dir-listing
    for f in fs::read_dir("/System")? {
        println!("{:?}", f?.path());
    }

    Ok(())
}

fn list_var_dir() -> Result<(), Box<dyn Error>> {
    //ruleid: exposure-dir-listing
    for f in fs::read_dir("/var")? {
        println!("{:?}", f?.path());
    }

    Ok(())
}

fn main() -> Result<(), Box<dyn Error>> {
    list_user_dir()?;
    list_system_dir()?;
    list_sensitive_dir()?;

    Ok(())
}
