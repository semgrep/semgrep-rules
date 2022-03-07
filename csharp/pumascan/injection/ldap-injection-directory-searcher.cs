
// test code from https://pumascan.com/rules/#sec0118-ldap-injection-directory-searcher
class Foo{  
    public void BadSetup(object model){
        DirectoryEntry entry = new DirectoryEntry("LDAP://DC=example.com, DC=COM/");
        // ruleid:ldap-injection-directory-searcher 
        DirectorySearcher searcher = new DirectorySearcher(entry, string.Format("(name={0})", model.UserName);
        searcher.SearchScope = SearchScope.Subtree;
        SearchResultCollection resultCollection = searcher.FindAll();
    }

    public void GoodSetup(object model){
        DirectoryEntry entry = new DirectoryEntry("LDAP://DC=example.com, DC=COM/");
        // ok:ldap-injection-directory-searcher 
        DirectorySearcher searcher = new DirectorySearcher(entry, string.Format("(name={0})", Encoder.LdapFilterEncode(model.UserName)));
        searcher.SearchScope = SearchScope.Subtree;
        SearchResultCollection resultCollection = searcher.FindAll();
    }

}
            