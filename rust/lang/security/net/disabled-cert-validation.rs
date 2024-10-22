fn reqwests_f1() -> Result<(), Box<dyn std::error::Error>> {
    let builder = reqwest::ClientBuilder::new();
    // ruleid: disabled-cert-validation
    let builder = builder.danger_accept_invalid_certs(true);
    let client = builder.build()?;

    Ok(())
}

fn reqwests_f2() -> Result<(), Box<dyn std::error::Error>> {
    // ruleid: disabled-cert-validation
    let client = reqwest::ClientBuilder::new()
        .danger_accept_invalid_certs(true)
        .build()?;

    Ok(())
}

fn reqwests_f3() -> Result<(), Box<dyn std::error::Error>> {
    // ok: disabled-cert-validation
    let client = reqwest::ClientBuilder::new()
        // ok: disabled-cert-validation
        .danger_accept_invalid_certs(false)
        .build()?;

    Ok(())
}

fn main() {}
