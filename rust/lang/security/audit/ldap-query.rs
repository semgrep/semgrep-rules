use ldap3::result::Result;
use ldap3::{LdapConn, Scope, SearchEntry};

//We need to evaluate how this works and semgrep doesnt support
fn main() -> Result<()> {
    //ruleid: ldap-injection
    let a = requests::get("http://example.org/get").unwrap();
    let mut ldap = LdapConn::new("ldap://localhost:2389")?;
    let (rs, _res) = ldap
        .search(
            a,
            Scope::Subtree,
            "(&(objectClass=locality)(l=ma*))",
            vec!["l"],
        )?
        .success()?;
    for entry in rs {
        println!("{:?}", SearchEntry::construct(entry));
    }
    Ok(ldap.unbind()?)
}
