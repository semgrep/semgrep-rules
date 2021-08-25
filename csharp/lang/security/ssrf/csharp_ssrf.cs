using System.Net.WebRequest;
using System.Uri;

namespace Ssrf
{
    public class Ssrf
    {
        // ruleid: ssrf
        public void ssrf1(string ssrf)
        {
            Uri uri = new Uri(ssrf);
            WebRequest webRequest = WebRequest.Create(uri);

        }

        // ruleid: ssrf
        public void ssrf2(string ssrf)
        {
            WebRequest webRequest = WebRequest.Create(ssrf);

        }

    }
}
