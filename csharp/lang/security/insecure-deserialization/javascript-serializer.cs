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
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
