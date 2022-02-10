namespace SomeNamespace{
    public class Foo{
        public void ReaderBad(string userInput)
        {
            XmlTextReader myReader = new XmlTextReader(new StringReader(userInput));

            // ruleid: xmltextreader-unsafe-defaults
            while (myReader.Read())
            {
                if (myReader.NodeType == XmlNodeType.Element)
                {
                    // ruleid: xmltextreader-unsafe-defaults
                    Console.WriteLine(myReader.ReadElementContentAsString());
                }
            }
            Console.ReadLine();
        }

        public static void StaticReaderBad(string userInput)
        {
            XmlTextReader myReader = new XmlTextReader(new StringReader(userInput));

            // ruleid: xmltextreader-unsafe-defaults
            while (myReader.Read())
            {
                if (myReader.NodeType == XmlNodeType.Element)
                {
                    // ruleid: xmltextreader-unsafe-defaults
                    Console.WriteLine(myReader.ReadElementContentAsString());
                }
            }
            Console.ReadLine();
        }

        public void ReaderGood(string userInput)
        {
            XmlTextReader myReader = new XmlTextReader(new StringReader(userInput));
            myReader.DtdProcessing = DtdProcessing.Prohibit;
            // ok: xmltextreader-unsafe-defaults
            while (myReader.Read())
            {
                if (myReader.NodeType == XmlNodeType.Element)
                {
                    // ok: xmltextreader-unsafe-defaults
                    Console.WriteLine(myReader.ReadElementContentAsString());
                }
            }
            Console.ReadLine();
        }
    }
}