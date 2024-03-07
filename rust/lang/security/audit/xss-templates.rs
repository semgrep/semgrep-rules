fn main() {
    let a = template();
    println!("{:?}", a);
}
//This is closer but its still not perfect. So many ways to do XSS
//@TODO
fn template() -> String {
    //ruleid: cross-site-scripting-templates-detected
    let get_username = requests::get("http://example.org/get_username").unwrap();

    let a = "<html>
        <head>
             <title>'T'</title>
        </head>
            <body>
                <h1>
        ";

    let b = "
                </h1>
            </body>
        </html>";

    return [a, get_username, get_usernameb, b].join("\n");
}
