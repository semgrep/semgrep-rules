
// test code from https://pumascan.com/rules/#sec0037-xml-document
class Foo{  

    public void Bad(string xml){
        XmlUrlResolver resolver = new XmlUrlResolver();
        resolver.Credentials = CredentialCache.DefaultCredentials;

        XmlDocument xmlDoc = new XmlDocument();        
        xmlDoc.XmlResolver = resolver;
        // ruleid:xml-document-external-entity-expansion 
        xmlDoc.LoadXml(xml);
    }
    public void Good(string xml){
        XmlDocument xmlDoc = new XmlDocument();
        // ok:xml-document-external-entity-expansion 
        xmlDoc.XmlResolver = null;
        xmlDoc.LoadXml(xml);
    }
}
            