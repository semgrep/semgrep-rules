using System.Runtime.Serialization.Formatters.Soap;

namespace InsecureDeserialization
{
    public class InsecureSoapFormatterDeserialization
    {
        public void SoapFormatterDeserialization(string json)
        {
            try
            {
                MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));

                // ruleid: insecure-soapformatter-deserialization
                SoapFormatter soapFormatter = new SoapFormatter();
                object obj = soapFormatter.Deserialize(ms);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
