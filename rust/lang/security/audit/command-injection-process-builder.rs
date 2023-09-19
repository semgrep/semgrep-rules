//ruleid: dangerous-spawn-process
fn main() {
    let a = requests::get("http://example.org/get").unwrap();
    Command::new("ls").arg(a);
}
