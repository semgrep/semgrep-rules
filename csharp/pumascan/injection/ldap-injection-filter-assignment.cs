
// test code from https://pumascan.com/rules/#sec0119-ldap-injection-directory-searcher
class Foo{  
    public void BadSetup(object model){
        DirectoryEntry entry = new DirectoryEntry("LDAP://DC=example.com, DC=COM");
        DirectorySearcher searcher = new DirectorySearcher(entry);
        searcher.SearchScope = SearchScope.Subtree;
        // ruleid:ldap-injection-filter-assignment 
        searcher.Filter = string.Format("(name={0})", model.UserName);
        SearchResultCollection resultCollection = searcher.FindAll();

}
    public void GoodSetup(object model){
        DirectoryEntry entry = new DirectoryEntry("LDAP://DC=example.com, DC=COM");
        DirectorySearcher searcher = new DirectorySearcher(entry);
        searcher.SearchScope = SearchScope.Subtree;
        // ok:ldap-injection-filter-assignment 
        searcher.Filter = string.Format("(name={0})", Encoder.LdapFilterEncode(model.UserName));
        SearchResultCollection resultCollection = searcher.FindAll();
    }
}
            