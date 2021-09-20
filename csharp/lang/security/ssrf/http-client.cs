using System.Net.Http;

namespace ServerSideRequestForgery
{
    public class Ssrf
    {
        #region Pattern 1
        // ruleid: ssrf
        public void HttpClientAsync(string host)
        {
            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetAsync(host).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ruleid: ssrf
        public void HttpClientAsync2(string host)
        {
            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetAsync(host + "constant").Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void HttpClientAsync(string host)
        {
            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetAsync("constant").Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        #endregion

        #region Pattern 2
        // ruleid: ssrf
        public void HttpClientAsyncWithStringConcatenation(string host)
        {
            string uri = host + "constant";

            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetAsync(uri).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void HttpClientAsyncWithStringConcatenation(string host)
        {
            string uri = "constant";

            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetAsync(uri).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ruleid: ssrf
        public void HttpClientAsyncWithUri(string host)
        {
            Uri uri = new Uri(host);

            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetAsync(uri).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void HttpClientAsyncWithUri(string host)
        {
            Uri uri = new Uri("constant");

            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetAsync(uri).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        #endregion

        #region Pattern 3
        // ruleid: ssrf
        public void HttpClientStringAsync(string host)
        {
            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetStringAsync(host).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void HttpClientStringAsync(string host)
        {
            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetStringAsync("constant").Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        #endregion

        #region Pattern 4
        // ruleid: ssrf
        public void HttpClientStringAsyncWithStringConcatenation(string host)
        {
            string uri = host + "constant";

            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetStringAsync(uri).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void HttpClientStringAsyncWithStringConcatenation(string host)
        {
            string uri = "constant";

            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetStringAsync(uri).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ruleid: ssrf
        public void HttpClientStringAsyncWithUri(string host)
        {
            Uri uri = new Uri(host);

            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetStringAsync(uri).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        // ok: ssrf
        public void HttpClientStringAsyncWithUri(string host)
        {
            Uri uri = new Uri("constant");

            HttpClient client = new HttpClient();

            try
            {
                HttpResponseMessage response = client.GetStringAsync(uri).Result;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
        }

        #endregion
    }
}
