using System.Web.Script.Serialization;

namespace InsecureDeserialization
{
    public class InsecureJavascriptSerializerDeserialization
    {
        public void JavascriptSerializerDeserialization(string json)
        {
            try
            {
                // ruleid: insecure-javascriptserializer-deserialization
                var serializer = new JavaScriptSerializer(new SimpleTypeResolver());
                serializer.DeserializeObject(json);

                var resolver = new SimpleTypeResolver()
                // ruleid: insecure-javascriptserializer-deserialization
                var serializer2 = new JavaScriptSerializer(resolver);
                serializer2.DeserializeObject(json);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
