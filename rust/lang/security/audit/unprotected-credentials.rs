use serde::{Deserialize, Serialize};
use serde_json;
use std::env;
use std::error::Error;
use std::fs::File;
use std::io::Read;
use std::path::PathBuf;

#[derive(Debug, Serialize, Deserialize)]
struct PasswordConfig {
    pub password: String,
}

fn unprotected_credentials_1() -> Result<(), Box<dyn Error>> {
    let mut path: PathBuf = env::var("HOME")?.into();
    //ruleid: unprotected-credentials
    path.push("password.json");
    let mut buf = String::new();
    let mut f = File::open(path)?;
    f.read_to_string(&mut buf)?;
    let conf: PasswordConfig = serde_json::from_str(&buf)?;

    Ok(())
}

fn unprotected_credentials_2() -> Result<(), Box<dyn Error>> {
    //ruleid: unprotected-credentials
    let path = PathBuf::from("/Users/abc123/passwords.json");
    let mut buf = String::new();
    let mut f = File::open(path)?;
    f.read_to_string(&mut buf)?;
    let conf: PasswordConfig = serde_json::from_str(&buf)?;

    Ok(())
}

fn main() -> Result<(), Box<dyn Error>> {
    unprotected_credentials_1()?;
    unprotected_credentials_2()?;

    Ok(())
}
