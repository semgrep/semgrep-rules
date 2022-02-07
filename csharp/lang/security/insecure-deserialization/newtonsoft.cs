using Newtonsoft.Json;

namespace InsecureDeserialization
{
    public class InsecureNewtonsoftDeserialization
    {
        public void NewtonsoftDeserialization(string json)
        {
            try
            {
                // ruleid: insecure-newtonsoft-deserialization
                JsonConvert.DeserializeObject<object>(json, new JsonSerializerSettings
                {
                    TypeNameHandling = TypeNameHandling.All
                });
            } catch(Exception e)
            {
                Console.WriteLine(e);
            }
        }

        public void ConverterOverrideSettings(){
            JsonConvert.DefaultSettings = () => 
                //ruleid: insecure-newtonsoft-deserialization
                new JsonSerializerSettings{TypeNameHandling = TypeNameHandling.Auto};
            Bar newBar = JsonConvert.DeserializeObject<Bar>(someJson);
            }
    }
}
