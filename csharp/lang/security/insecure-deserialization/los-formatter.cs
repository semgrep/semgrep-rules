using System.Web.UI;

namespace InsecureDeserialization
{
    public class InsecureLosFormatterDeserialization
    {
        public void LosFormatterDeserialization(string json)
        {
            try
            {
                // ruleid: insecure-losformatter-deserialization
                LosFormatter losFormatter = new LosFormatter();
                object obj = losFormatter.Deserialize(json);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
