using Newtonsoft.Json;

namespace InsecureDeserialization
{
    public class InsecureNewtonsoftDeserialization
    {
        public void NewtonsoftDeserialization(string json)
        {
            try
            {
                JsonConvert.DeserializeObject<object>(json, new JsonSerializerSettings
                {
                    TypeNameHandling = TypeNameHandling.All
                });
            } catch(Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
