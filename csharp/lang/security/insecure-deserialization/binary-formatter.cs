using System.Runtime.Serialization.Formatters.Binary;

namespace InsecureDeserialization
{
    public class InsecureBinaryFormatterDeserialization
    {
        public void BinaryFormatterDeserialization(string json)
        {
            try
            {
                // ruleid: insecure-binaryformatter-deserialization
                BinaryFormatter binaryFormatter = new BinaryFormatter();

                MemoryStream memoryStream = new MemoryStream(Encoding.UTF8.GetBytes(json));
                binaryFormatter.Deserialize(memoryStream);
                memoryStream.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
