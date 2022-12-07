use reqwest::header;

// ruleid: reqwest-accept-invalid
let client = reqwest::Client::builder()
    .danger_accept_invalid_hostnames(true)
    .build();

// ruleid: reqwest-accept-invalid
let client = reqwest::Client::builder()
    .danger_accept_invalid_certs(true)
    .build();

// ruleid: reqwest-accept-invalid
let client = reqwest::Client::builder()
    .user_agent("USER AGENT")
    .cookie_store(true)
    .danger_accept_invalid_hostnames(true)
    .build();

// ruleid: reqwest-accept-invalid
let client = reqwest::Client::builder()
    .user_agent("USER AGENT")
    .cookie_store(true)
    .danger_accept_invalid_certs(true)
    .build();

// ok: reqwest-accept-invalid
let client = reqwest::Client::builder()
    .user_agent("USER AGENT")
    .build();
