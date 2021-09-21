using System.Net.WebRequest;
using System.Uri;

namespace Ssrf
{
    public class Ssrf
    {
        #region Pattern 1
        // ruleid: ssrf
        public void WebRequest(string host)
        {
            try
            {
                WebRequest webRequest = WebRequest.Create(host);;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void WebRequest(string host)
        {
            try
            {
                WebRequest webRequest = WebRequest.Create("constant");;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        #endregion

        #region Pattern 2

        // ruleid: ssrf
        public void WebRequestWithStringConcatenation(string host)
        {

            String baseUrl = "constant" + host;

            WebRequest webRequest = WebRequest.Create(baseUrl);
        }

        // ok: ssrf
        public void WebRequestWithStringConcatenation(string host)
        {
            String baseUrl = "constant";
            WebRequest webRequest = WebRequest.Create(baseUrl);
        }

        // ruleid: ssrf
        public void WebRequestWithUri(string host)
        {
            Uri uri = new Uri(host);
            WebRequest webRequest = WebRequest.Create(uri);
        }

        // ok: ssrf
        public void ssrf5(string host)
        {
            Uri uri = new Uri("constant");
            WebRequest webRequest = WebRequest.Create(uri);
        }

        #endregion

        #region Pattern 3

        // ruleid: ssrf
        public void WebRequestStringToUri(string host)
        {

            String baseUrl = "constant" + host;
            Uri uri = new Uri(baseUrl);

            WebRequest webRequest = WebRequest.Create(uri);
        }

        // ok: ssrf
        public void WebRequestStringToUri(string host)
        {
            String baseUrl = "constant" + "constant";
            Uri uri = new Uri(baseUrl);
            WebRequest webRequest = WebRequest.Create(baseUrl);
        }

        #endregion
    }
}
