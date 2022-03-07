
// test code from https://pumascan.com/rules/#sec0036-xml-reader
class Foo{  
    public void Bad(string xml){
        XmlReaderSettings rs = new XmlReaderSettings
        {
        
            DtdProcessing = DtdProcessing.Parse,
        };
        // ruleid:xml-reader-external-entity-expansion 
        XmlReader reader = XmlReader.Create("evil.xml", rs);
        while (reader.Read())
        {
            // do stuff
        }
    }
    public void Good(string xml){
        XmlReaderSettings rs = new XmlReaderSettings
        {
        // ok:xml-reader-external-entity-expansion 
            DtdProcessing = DtdProcessing.Prohibit,
        };

        XmlReader reader = XmlReader.Create("evil.xml", rs);
        while (reader.Read()){
            //do stuff
        }
    }

    public static void LateBindingBad(string input){
        XmlReaderSettings rs = new XmlReaderSettings();
        rs.DtdProcessing = DtdProcessing.Parse;

        // ruleid:xml-reader-external-entity-expansion 
        XmlReader myReader = XmlReader.Create(new StringReader(input),rs);
                
        while (myReader.Read())
        {
            Console.WriteLine(myReader.Value);
        }
        Console.ReadLine();
    }
}
            