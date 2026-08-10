public List<Knowledge> Search1(string input)
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

public List<Knowledge> Search2(string input)
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

public List<Knowledge> Search3(string input)
{
    List<Knowledge> searchResult = new List<Knowledge>();
    var webRoot = _env.WebRootPath;
    var file = System.IO.Path.Combine(webRoot, "Knowledgebase.xml");

    XmlDocument xmlDoc = new XmlDocument();
    xmlDoc.Load(file);

    XPathNavigator nav = xmlDoc.CreateNavigator();
    // ruleid: xpath-injection
    XPathExpression expr = nav.Compile($@"//knowledge[tags[contains(text(),'{input}')] and sensitivity/text()='Public']");

    XPathNodeIterator nodes = nav.Select(expr);
}


public List<Knowledge> Search4(string input)
{
    List<Knowledge> searchResult = new List<Knowledge>();
    var webRoot = _env.WebRootPath;
    var file = System.IO.Path.Combine(webRoot,"Knowledgebase.xml");
    
    XmlDocument XmlDoc = new XmlDocument();
    XmlDoc.Load(file);    
    
    XPathNavigator nav = XmlDoc.CreateNavigator();
    // ruleid: xpath-injection
    Object expr = nav.Select(@"//knowledge[tags[contains(text(),'" + input + "')] and sensitivity/text() ='Public']");
}

public List<Knowledge> Search5(string input)
{
    List<Knowledge> searchResult = new List<Knowledge>();
    var webRoot = _env.WebRootPath;
    var file = System.IO.Path.Combine(webRoot,"Knowledgebase.xml");
    
    XmlDocument XmlDoc = new XmlDocument();
    XmlDoc.Load(file);    
    
    XPathNavigator nav = XmlDoc.CreateNavigator();
    // ruleid: xpath-injection
    var expr = nav.Select($@"//knowledge[tags[contains(text(),'{input}')] and sensitivity/text()='Public']");
}

public List<Knowledge> Search6(string input)
{
    List<Knowledge> searchResult = new List<Knowledge>();
    var webRoot = _env.WebRootPath;
    var file = System.IO.Path.Combine(webRoot,"Knowledgebase.xml");
    
    XmlDocument XmlDoc = new XmlDocument();
    XmlDoc.Load(file);    
    
    XPathNavigator nav = XmlDoc.CreateNavigator();
    // ruleid: xpath-injection
    var expr = nav.SelectSingleNode($@"//knowledge[tags[contains(text(),'{input}')] and sensitivity/text()='Public']");
}