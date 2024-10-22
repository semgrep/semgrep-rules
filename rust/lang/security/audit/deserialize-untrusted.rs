//id: deserialize-untrusted-data
#[derive(serde::Deserialize)]
struct MyData {
    a: u8,
    b: String,
}

fn main() {
    //ruleid: deserialize-untrusted-data
    let data_from_str: MyData = serde_json::from_str("{invalid: json}").unwrap();
    //ruleid: deserialize-untrusted-data
    let data_from_bytes: MyData = serde_json::from_slice("{invalid: bytes}".as_bytes()).unwrap();

    //ruleid: deserialize-untrusted-data
    let data_from_value: u8 =
        serde_json::from_value(serde_json::value::Value::Bool(false)).unwrap();
    //ruleid: deserialize-untrusted-data
    let data_from_reader: MyData = serde_json::from_reader(std::io::BufReader::new(
        std::fs::File::open("/tmp/txtfile.txt").unwrap(),
    ))
        .unwrap();
}

fn safe_deserialization() -> Result<(), serde_json::Error> {
    // Use the `?` operator to return an error if the data is invalid
    //ok: deserialize-untrusted-data
    let data_from_str: MyData = serde_json::from_str("{invalid: json}")?;

    // Use the `match` operator to handle deserialization errors
    //ok: deserialize-untrusted-data
    let data_from_bytes: MyData = match serde_json::from_slice("newobject".as_bytes()) {
        Ok(data) => data,
        Err(e) => MyData {
            a: 0,
            b: "Invalid data supplied, created other object".to_string(),
        },
    };

    // Use an `if let` syntax to perform logic conditionally
    //ok: deserialize-untrusted-data
    if let Ok(data) = serde_json::from_value(serde_json::value::Value::Bool(true)) {
        println!("Data was: {}", data && true);
    };

    Ok(())
}
