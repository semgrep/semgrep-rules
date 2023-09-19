use std::env;
use std::error::Error;
use std::fs::File;

/// CWE-22 Vulnerability: Path injection from environment variable
//ruleid: path-injection-env-var
fn path_injection_env_var() -> Result<(), Box<dyn Error>> {
    let subpath = env::var("SUBPATH")?;
    let mut path = env::current_dir()?;
    path.push(subpath);

    println!("path_injection_env_var\t{:?}", path);
    File::open(path)?;

    Ok(())
}

fn main() -> Result<(), Box<dyn Error>> {
    path_injection_env_var();

    Ok(())
}
