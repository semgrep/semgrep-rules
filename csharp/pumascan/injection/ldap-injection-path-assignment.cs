
// test code from https://pumascan.com/rules/#sec0117-ldap-injection-path-assignment
class Foo{  
    public void BadSetup(object model){
        DirectoryEntry entry = new DirectoryEntry();
        // ruleid:ldap-injection-path-assignment 
        entry.Path = string.Format("LDAP://DC={0},DC=COM,CN=Users", model.Domain);
        entry.Username = model.UserName;
        entry.Password = model.Password;
        DirectorySearcher searcher = new DirectorySearcher(entry);
        searcher.SearchScope = SearchScope.Subtree;
        searcher.Filter = $"(samaccountname=DOMAIN\\BobbyTables)";
        SearchResult result = searcher.FindOne();
    }

    public void GoodSetup(object model){
        DirectoryEntry entry = new DirectoryEntry();
        // ok:ldap-injection-path-assignment 
        entry.Path = string.Format("LDAP://DC={0},DC=COM,CN=Users", Encoder.LdapDistinguishedNameEncode(model.Domain));
        entry.Username = model.UserName;
        entry.Password = model.Password;
        DirectorySearcher searcher = new DirectorySearcher(entry);
        searcher.SearchScope = SearchScope.Subtree;
        searcher.Filter = $"(samaccountname=DOMAIN\\BobbyTables)";
        SearchResult result = searcher.FindOne();
    }
}
            