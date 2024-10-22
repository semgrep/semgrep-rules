use std::error::Error;
use std::fmt;

#[derive(Debug)]
pub struct SensitiveError {
    msg: String,
}

impl fmt::Display for SensitiveError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "SensitiveError: {}", self.msg)
    }
}

impl Error for SensitiveError {
}

// This function returns an error with sensitive information internalized
//ruleid: exposure-error-msg
fn sensitive_error() -> Result<(), Box<dyn Error>> {
    let msg = String::from("password: pass1234");
    let err = Box::new(SensitiveError { msg });

    Err(err)
}

fn main() {
    let err = sensitive_error();

    // NOTE: There is an error in semgrep v0.59.0 which causes function-like
    // macros not to get correctly identified.

    println!("err = {:?}", err);
}
