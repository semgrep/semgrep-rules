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
                    // ruleid: insecure-newtonsoft-deserialization
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

        public void ConverterOverrideSettingsStaggeredInitialize(){
            var settings = new JsonSerializerSettings();
            //ruleid: insecure-newtonsoft-deserialization
            settings.TypeNameHandling = TypeNameHandling.Auto;
            Bar newBar = JsonConvert.DeserializeObject<Bar>(someJson,settings);
        }

        public void ConverterOverrideSettingsMultipleSettingArgs(){
            JsonConvert.DefaultSettings = () => 
                new JsonSerializerSettings{
                    Culture = InvariantCulture,
                    //ruleid: insecure-newtonsoft-deserialization
                    TypeNameHandling = TypeNameHandling.Auto,
                    TraceWriter = traceWriter
                    };
            Bar newBar = JsonConvert.DeserializeObject<Bar>(someJson);
        }

      public void SafeDeserialize(){
        Bar newBar = JsonConvert.DeserializeObject<Bar>(someJson, new JsonSerializerSettings
        {
            //ok: insecure-newtonsoft-deserialization
            TypeNameHandling = TypeNameHandling.None
        });
      }

      public void SafeDefaults(){
        //ok: insecure-newtonsoft-deserialization
        Bar newBar = JsonConvert.DeserializeObject<Bar>(someJson);
      }
    }
}
