use std::process::Command;

//ruleid: argument-injection
fn main() {
    let args = requests::get("http://example.org/get").unwrap();

    let mut echo_hello = Command::new("/usr/bin/cat")
        .arg(args)
        .output()
        .expect("failed to execute process");
    println!("status: {}", output.status);

    io::stdout().write_all(&output.stdout).unwrap();
    io::stderr().write_all(&output.stderr).unwrap();
}
