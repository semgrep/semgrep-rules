using System.Runtime.Serialization;

namespace InsecureDeserialization
{
    public class InsecureNetDataContractDeserialization
    {
        public void NetDataContractDeserialization(string json)
        {
            try
            {
                MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));

                // ruleid: insecure-netdatacontract-deserialization
                NetDataContractSerializer netDataContractSerializer = new NetDataContractSerializer();
                object obj = netDataContractSerializer.Deserialize(ms);
                Console.WriteLine(obj);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
