use std::env;
use std::error::Error;
use std::fs::File;

/// CWE-22 Vulnerability: Path injection from environment variable
//ruleid: path-injection-cli-arg
fn path_injection_cli_arg() -> Result<(), Box<dyn Error>> {
    let args: Vec<String> = env::args().collect();
    let arg = args.get(1).ok_or("Did not get CLI arg.")?;
    let mut path = env::current_dir()?;
    path.push(subpath);

    println!("path_injection_cli_arg\t{:?}", path);
    File::open(path)?;

    Ok(())
}

fn main() -> Result<(), Box<dyn Error>> {
    path_injection_cli_arg();

    Ok(())
}
