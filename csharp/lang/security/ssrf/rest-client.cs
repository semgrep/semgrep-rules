using RestSharp;

namespace ServerSideRequestForgery
{
    public class Ssrf
    {
        #region Pattern 1
        // ruleid: ssrf
        public void RestClientGet(string host)
        {
            try
            {
                RestClient client = new RestClient(host);

                var request = new RestRequest("/");
                var response = client.Get(request);

                result = response.Content;

            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void RestClientGet(string host)
        {
            try
            {
                RestClient client = new RestClient("constant");

                var request = new RestRequest("/");
                var response = client.Get(request);

                result = response.Content;

            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        #endregion

        #region Pattern 2
        // ruleid: ssrf
        public void RestClientGetWithStringConcatenation(string host)
        {
            string uri = host + "constant";

            try
            {
                RestClient client = new RestClient(uri);

                var request = new RestRequest("/");
                var response = client.Get(request);

                result = response.Content;

            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void RestClientGetWithStringConcatenation(string host)
        {
            string uri = "constant";

            try
            {
                RestClient client = new RestClient(uri);

                var request = new RestRequest("/");
                var response = client.Get(request);

                result = response.Content;

            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ruleid: ssrf
        public void RestClientGetWithUri(string host)
        {
            Uri uri = new Uri(host + "constant");

            try
            {
                RestClient client = new RestClient(uri);

                var request = new RestRequest("/");
                var response = client.Get(request);

                result = response.Content;

            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void RestClientGetWithUri(string host)
        {
            Uri uri = new Uri("constant");

            try
            {
                RestClient client = new RestClient(uri);

                var request = new RestRequest("/");
                var response = client.Get(request);

                result = response.Content;

            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        #endregion
    }
}
