
// test code from https://pumascan.com/rules/#sec0035-xxe-xpathdocument
class Foo{  

    public void ReadXmlBad(object model){
        // ruleid:xpathdocument-external-entity-expansion 
        XPathDocument xmlDoc = new XPathDocument(model.FilePath);
        XPathNavigator nav = xmlDoc.CreateNavigator();
    }

    public void ReadXmlGood(object model){
        XmlReader reader = XmlReader.Create(model.FilePath);
        // ok:xpathdocument-external-entity-expansion 
        XPathDocument xmlDoc = new XPathDocument(reader);
        XPathNavigator nav = xmlDoc.CreateNavigator();
    }
}
            