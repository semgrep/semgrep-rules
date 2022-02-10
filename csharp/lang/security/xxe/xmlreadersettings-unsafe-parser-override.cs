public void ParseBad(string input){
    XmlReaderSettings rs = new XmlReaderSettings();
    rs.DtdProcessing = DtdProcessing.Parse;

    // ruleid:xmlreadersettings-unsafe-parser-override
    XmlReader myReader = XmlReader.Create(new StringReader(input),rs);
            
    while (myReader.Read())
    {
        Console.WriteLine(myReader.Value);
    }
    Console.ReadLine();
}

public static void StaticParseBad(string input){
    XmlReaderSettings rs = new XmlReaderSettings();
    rs.DtdProcessing = DtdProcessing.Parse;

    // ruleid:xmlreadersettings-unsafe-parser-override
    XmlReader myReader = XmlReader.Create(new StringReader(input),rs);
            
    while (myReader.Read())
    {
        Console.WriteLine(myReader.Value);
    }
    Console.ReadLine();
}

public void ParseBad2(string input){
    XmlReaderSettings rs = new XmlReaderSettings();
    rs.DtdProcessing = DtdProcessing.Parse;

    // ruleid:xmlreadersettings-unsafe-parser-override
    XmlReader myReader = XmlReader.Create(input,rs);
            
    while (myReader.Read())
    {
        Console.WriteLine(myReader.Value);
    }
    Console.ReadLine();
}

public void ParseBad3(string input){
    XmlReaderSettings rs = new XmlReaderSettings();
    rs.DtdProcessing = DtdProcessing.Parse;

    using(var reader = new StringReader(input)){
        // ruleid:xmlreadersettings-unsafe-parser-override
        XmlReader myReader = XmlReader.Create(reader,rs);
                
        while (myReader.Read())
        {
            Console.WriteLine(myReader.Value);
        }
        Console.ReadLine();
    }
}

public void ParseGood(string input){
    XmlReaderSettings rs = new XmlReaderSettings();
    rs.DtdProcessing = DtdProcessing.Ignore;

    // ok: xmlreadersettings-unsafe-parser-override
    XmlReader myReader = XmlReader.Create(new StringReader(input),rs);
            
    while (myReader.Read())
    {
        Console.WriteLine(myReader.Value);
    }
    Console.ReadLine();
}

public void ParseGood2(string input){
    XmlReaderSettings rs = new XmlReaderSettings();
    // pre-override, not broken
    // ok: xmlreadersettings-unsafe-parser-override
    using(var reader = new StringReader(input,rs)){
        XmlReader myReader = XmlReader.Create(reader);
                
        while (myReader.Read())
        {
            Console.WriteLine(myReader.Value);
        }
        Console.ReadLine();
    }
    rs.DtdProcessing = DtdProcessing.Parse;

    // post-override, not providing reader settings, not broken
    // ok: xmlreadersettings-unsafe-parser-override
    using(var reader = new StringReader(input)){
        XmlReader myReader = XmlReader.Create(reader);
                
        while (myReader.Read())
        {
            Console.WriteLine(myReader.Value);
        }
        Console.ReadLine();
    }
}
public void ParseGood3(string input){
    XmlReaderSettings rs = new XmlReaderSettings();
    // ok: xmlreadersettings-unsafe-parser-override
    var something = input;
    rs.DtdProcessing = DtdProcessing.Parse;

    var notInput = someSafeLoad();
    // ok: xmlreadersettings-unsafe-parser-override
    XmlReader myReader = XmlReader.Create(new StringReader(notInput),rs);
            
    while (myReader.Read())
    {
        Console.WriteLine(myReader.Value);
    }
    Console.ReadLine();
}

