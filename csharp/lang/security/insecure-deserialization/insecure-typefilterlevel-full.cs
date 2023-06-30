namespace InsecureDeserialization
{
    public class InsecureTypeFilterLevel
    {
        public void SetTFL(string json)
        {
            BinaryServerFormatterSinkProvider serverProvider = new BinaryServerFormatterSinkProvider(formatterProps, null);

            // ruleid: insecure-typefilterlevel-full
            serverProvider.TypeFilterLevel = System.Runtime.Serialization.Formatters.TypeFilterLevel.Full;

            // ruleid: insecure-typefilterlevel-full
            var provider = new BinaryServerFormatterSinkProvider { TypeFilterLevel = TypeFilterLevel.Full };

            var dict = new Hashtable();
            dict["typeFilterLevel"] = "Full";
            // ruleid: insecure-typefilterlevel-full
            BinaryServerFormatterSinkProvider serverProvider2 = new BinaryServerFormatterSinkProvider(dict, null);
        }
    }
}
