
// test code from https://pumascan.com/rules/#sec0114-ldap-injection-directory-entry
class Foo{  
    public void BadSetup(object model){
        DirectoryEntry entry = new DirectoryEntry(string.Format("LDAP://DC={0}, DC=COM/", model.Domain));
        // ruleid:ldap-injection-directory-entry 
        DirectorySearcher searcher = new DirectorySearcher(entry);
        searcher.SearchScope = SearchScope.Subtree;
        searcher.Filter = "(name={BobbyTables})";
        SearchResultCollection resultCollection = searcher.FindAll();
    }

    public void GoodSetup(object model){
        
        DirectoryEntry entry = new DirectoryEntry(string.Format("LDAP://DC={0}, DC=COM/", Encoder.LdapDistinguishedNameEncode(model.Domain));
        // ok:ldap-injection-directory-entry 
        DirectorySearcher searcher = new DirectorySearcher(entry);
        searcher.SearchScope = SearchScope.Subtree;
        searcher.Filter = "(name={BobbyTables})";
        SearchResultCollection resultCollection = searcher.FindAll();
    }

    //we can't prove this is trash
    public void GoodSetup2(DirectoryEntry someEntry){
        
        // ok:ldap-injection-directory-entry 
        DirectorySearcher searcher = new DirectorySearcher(entry);
        searcher.SearchScope = SearchScope.Subtree;
        searcher.Filter = "(name={BobbyTables})";
        SearchResultCollection resultCollection = searcher.FindAll();
    }

}
            