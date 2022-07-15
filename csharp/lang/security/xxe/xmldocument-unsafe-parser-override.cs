public class Foo{
    public void LoadBad(string input)
    {
        string fileName = @"C:\Users\user\Documents\test.xml";
        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.XmlResolver = new XmlUrlResolver();
        // ruleid: xmldocument-unsafe-parser-override
        xmlDoc.Load(input);
        Console.WriteLine(xmlDoc.InnerText);

        Console.ReadLine();
    }

    public static void StaticLoadBad(string input)
    {
        string fileName = @"C:\Users\user\Documents\test.xml";
        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.XmlResolver = new XmlUrlResolver();
        // ruleid: xmldocument-unsafe-parser-override
        xmlDoc.Load(input);
        Console.WriteLine(xmlDoc.InnerText);

        Console.ReadLine();
    }
    
    public void LoadGood(string input)
    {
        XmlDocument xmlDoc = new XmlDocument();
        // ok: xmldocument-unsafe-parser-override
        xmlDoc.Load(input);
        Console.WriteLine(xmlDoc.InnerText);

        Console.ReadLine();
    }
}