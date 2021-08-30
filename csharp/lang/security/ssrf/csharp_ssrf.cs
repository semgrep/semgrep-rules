using System.Net.WebRequest;
using System.Uri;

namespace Ssrf
{
    public class Ssrf
    {
        // ruleid: ssrf
        // ko
        public void ssrf1(string ssrf)
        {
            Uri uri = new Uri(ssrf);
            WebRequest webRequest = WebRequest.Create(uri);

        }

        // ruleid: ssrf
        // ko
        public void ssrf2(string ssrf)
        {
            WebRequest webRequest = WebRequest.Create(ssrf);

        }
        // ruleid: ssrf
        // ko
        public void ssrf3(string ssrf)
        {

            String base = "https://www.example.com";

            Uri uri = new Uri(base+ssrf);
            WebRequest webRequest = WebRequest.Create(uri);



        }
        // ruleid: ssrf
        // ok
        public void ssrf4(string ssrf)
        {


            WebRequest webRequest = WebRequest.Create("https://www.example.com");



        }
        // ruleid: ssrf
        // ok
        public void ssrf5(string ssrf)
        {

            String domain = "www.example.com";

            Uri uri = new Uri(ssrf);
            if (domain.Equals(uri.Host)){
            WebRequest webRequest = WebRequest.Create(request);
          }



        }

    }
}
