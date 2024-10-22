use std::process::Command;

//ruleid: command-injection
fn main() {
    let get_args = requests::get("http://example.org/get").unwrap();

    let mut echo_hello = Command::new("/usr")
        .arg(get_args)
        .output()
        .expect("failed to execute process");
    println!("status: {}", echo_hello);
}
