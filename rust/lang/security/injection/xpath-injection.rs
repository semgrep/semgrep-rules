use libxml::parser::Parser;
use libxml::xpath::Context;
use std::error::Error;

fn get_xml_string() -> String {
    String::from(
        r#"<?xml version="1.0" encoding="utf-8"?>
    <Employees>
       <Employee ID="1">
          <FirstName>Chris</FirstName>
          <LastName>Jacoby</LastName>
          <UserName>cjacoby</UserName>
          <Password>Secret1</Password>
          <Type>User</Type>
       </Employee>
       <Employee ID="2">
          <FirstName>Peter</FirstName>
          <LastName>Pan</LastName>
          <UserName>PPan</UserName>
          <Password>Secret2</Password>
          <Type>Admin</Type>
       </Employee>
       <Employee ID="3">
          <FirstName>Donald</FirstName>
          <LastName>Duck</LastName>
          <UserName>donaldduck</UserName>
          <Password>Secret3</Password>
          <Type>User</Type>
       </Employee>
    </Employees>"#,
    )
}

//ruleid: xpath-injection
fn login(username: &str, password: &str) -> Result<(), Box<dyn Error>> {
    let query = format!(
        "//Employee[UserName/text()='{username}' and Password/text()='{password}']",
        username = username,
        password = password
    );

    println!("query = '{:?}'", query);
    let parser = Parser::default();
    let text = get_xml_string();
    let document = parser.parse_string(text)?;
    let context = Context::new(&document).unwrap();
    let res = context.evaluate(&query).unwrap();
    for r in res.get_nodes_as_vec() {
        println!("r = {:?}", r.get_content());
    }

    Ok(())
}

fn main() -> Result<(), Box<dyn Error>> {
    // Normal query. Returns info for Donald Duck.
    login("donaldduck", "Secret3")?;

    // Injection. Returns all users.
    login("user' or 1=1 or 'a'='a", "pwd")?;

    Ok(())
}
