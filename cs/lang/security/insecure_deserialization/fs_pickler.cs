using MBrace.FsPickler.Json;

namespace InsecureDeserialization
{
    public class InsecureFsPicklerDeserialization
    {
        public void FsPicklerDeserialization(string json)
        {
            try
            {
                // ruleid: insecure-fspickler-deserialization
                var fsPickler = FsPickler.CreateJsonSerializer();
                MemoryStream memoryStream = new MemoryStream(Convert.FromBase64String(json));
                fsPickler.Deserialize<object>(memoryStream);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
