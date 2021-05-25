using fastJSON;
using System.Web.UI;
using Newtonsoft.Json;
using MBrace.FsPickler.Json;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Soap;
using System.Runtime.Serialization.Formatters.Binary;

namespace Deserialization
{
    public class InsecureDeserializationService
    {
        /*
         * Insecure Netwonsoft.JSON Deserialize usage
         */
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

        /*
         * Insecure FastJSON Deserialize usage
         */
        public void FastJSONDeserialization(string json)
        {
            try
            {
                var obj = JSON.ToObject(json, new JSONParameters { BadListTypeChecking = false });
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        /*
         * Insecure BinaryFormatter usage
         */
        public void BinaryFormatterDeserialization(string json)
        {
            try
            {
                BinaryFormatter binaryFormatter = new BinaryFormatter();

                MemoryStream memoryStream = new MemoryStream(Convert.FromBase64String(json));
                binaryFormatter.Deserialize(memoryStream);
                memoryStream.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        /*
         * Insecure LosFormatter usage
         */
        public void LosFormatterDeserialization(string json)
        {
            try
            {
                LosFormatter losFormatter = new LosFormatter();
                object obj = losFormatter.Deserialize(json);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        /*
         * Insecure SoapFormatter usage
         */
        public void SoapFormatterDeserialization(string json)
        {
            try
            {
                MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));

                SoapFormatter soapFormatter = new SoapFormatter();
                object obj = soapFormatter.Deserialize(ms);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        /*
         * Insecure NetDataContractSerializer usage
         */
        public void NetDataContractDeserialization(string json)
        {
            try
            {
                MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));

                NetDataContractSerializer netDataContractSerializer = new NetDataContractSerializer();
                object obj = netDataContractSerializer.Deserialize(ms);
                Console.WriteLine(obj);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        /*
         * Insecure FsPickler Deserialize usage
         */
        public void FsPicklerDeserialization(string json)
        {
            try
            {
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