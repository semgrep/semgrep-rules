use reqwest::header;
use reqwest::{blocking::Client, header::HeaderMap, header::HeaderValue, Url};

// ruleid: reqwest-set-sensitive
let mut headers = header::HeaderMap::new();
let header = header::HeaderValue::from_static("secret");
headers.insert(header::AUTHORIZATION, header);

// ruleid: reqwest-set-sensitive
let mut headers = header::HeaderMap::new();
let header = header::HeaderValue::from_static("secret");
headers.insert("Authorization", header);

// ruleid: reqwest-set-sensitive
let mut headers = header::HeaderMap::new();
let header = header::HeaderValue::from_static("secret").map_err(|e| {
    Error::Generic(format!(
        "Error"
    ))
});
headers.insert(header::AUTHORIZATION, header);

// Remove todo when Rust supports import equivalence
// todoruleid: reqwest-set-sensitive
let mut headers = HeaderMap::new();
let header = HeaderValue::from_static("secret");
headers.insert(header::AUTHORIZATION, header);

// ok: reqwest-set-sensitive
let mut headers = header::HeaderMap::new();
let header = header::HeaderValue::from_static("secret");
header.set_sensitive(true);
headers.insert(header::AUTHORIZATION, header);
