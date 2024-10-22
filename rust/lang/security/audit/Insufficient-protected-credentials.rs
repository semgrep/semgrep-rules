use postgres::{Connection, TlsMode};

//This works but does it really cover the rule? We need to rethink this one
//ruleid: insufficient-protected-credentials
fn main() {
    //The following code reads a password and uses the password to connect to a database.
    let password = requests::get("http://example.org/getPassword").unwrap();
    let url = format!(
        "postgresql://postgres:{}@localhost:5433:2994/food",
        password
    );
    let conn = Connection::connect(url, TlsMode::None).unwrap();
}
