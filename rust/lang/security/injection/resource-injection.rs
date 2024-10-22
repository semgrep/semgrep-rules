use actix_web::get;
use actix_web::web;
use actix_web::App;
use actix_web::HttpServer;
use serde::Deserialize;
use std::fs::File;
use std::io::Read;
use std::path::PathBuf;

const SERVER_ROOT: &'static str = "/home/httpd";

#[derive(Deserialize)]
struct PathParam {
    path: String,
}

// Blind resource injection from HTTP request query param
//ruleid: resource-injection
#[get("/")]
async fn index(params: web::Query<PathParam>) -> String {
    let mut path = PathBuf::from(SERVER_ROOT);
    path.push(params.path.clone());
    println!("Server accesing: {:?}", path);
    let mut f = File::open(path).expect("Could not open file. Does it exist?");
    let mut buf = String::new();
    f.read_to_string(&mut buf)
        .expect("Failed to read file content to buffer");

    buf
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| App::new().service(index))
        .bind("127.0.0.1:8080")?
        .run()
        .await
}
