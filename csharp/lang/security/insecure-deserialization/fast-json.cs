using fastJSON;

namespace InsecureDeserialization
{
    public class InsecureFastJSONDeserialization
    {
        public void FastJSONDeserialization(string json)
        {
            try
            {
                // ruleid: insecure-fastjson-deserialization
                var obj = JSON.ToObject(json, new JSONParameters { BadListTypeChecking = false });
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
