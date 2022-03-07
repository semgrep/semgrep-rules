
// test code from https://pumascan.com/rules/#sec0127-xpath-injection
class Foo{  
    public IActionResult Post(Model model)
{
    var doc = new XmlDocument { XmlResolver = null };
    doc.Load(configuration["UserXmlPath"]);
    // ruleid:xpath-injection 
    var results = doc.SelectNodes("/Users/User[id='" + model.UserName + "']");

    //Process login
    
    return View();
}



    public IActionResult Post(Model model)
{
    var userName = model.UserName;
    
    if (!Regex.IsMatch(userName, @"[A-za-z0-9]+"))
    {
        throw new ArgumentException("Invalid username parameter.");
    }

    var doc = new XmlDocument { XmlResolver = null };
    doc.Load(configuration["UserXmlPath"]);
    // ok:xpath-injection 
    var results = doc.SelectNodes("/Users/User[id='" + userName + "']");

    //Process login
    
    return View();
}

}
            