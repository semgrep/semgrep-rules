public List<Knowledge> Search(string input)
{
    List<Knowledge> searchResult = new List<Knowledge>();
    var webRoot = _env.WebRootPath;
    var file = System.IO.Path.Combine(webRoot,"Knowledgebase.xml");
    
    XmlDocument XmlDoc = new XmlDocument();
    XmlDoc.Load(file);    
    
    XPathNavigator nav = XmlDoc.CreateNavigator();
    // ruleid: xpath-injection
    XPathExpression expr = nav.Compile(@"//knowledge[tags[contains(text(),'" + input + "')] and sensitivity/text() ='Public']");
}

public List<Knowledge> Search(string input)
{
    List<Knowledge> searchResult = new List<Knowledge>();
    //string input;
    var webRoot = _env.WebRootPath;
    var file = System.IO.Path.Combine(webRoot,"Knowledgebase.xml");
    
    XmlDocument XmlDoc = new XmlDocument();
    XmlDoc.Load(file);    
    
    XPathNavigator nav = XmlDoc.CreateNavigator();
    // ok: xpath-injection
    XPathExpression expr = nav.Compile(@"//knowledge[tags[contains(text(),'keyword')] and sensitivity/text() ='Public']");
    
    var matchedNodes = nav.Select(expr);
}