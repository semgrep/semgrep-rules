using System.Net;

namespace ServerSideRequestForgery
{
    public class Ssrf
    {
        #region Pattern 1
        // ruleid: ssrf
        public string WebClient(string host)
        {
            string result = "";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenRead(host);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ruleid: ssrf
        public string WebClient2(string host)
        {
            string result = "";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenRead(host + "constant");
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ok: ssrf
        public string WebClient(string host)
        {
            string result = "";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenRead("constant");
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        #endregion

        #region Pattern 2
        // ruleid: ssrf
        public string WebClientStringConcatenation(string host)
        {
            string result = "";

            string uri = "constant" + host;

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenRead(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ok: ssrf
        public string WebClientStringConcatenation(string host)
        {
            string result = "";
            string uri = "constant";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenRead(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ruleid: ssrf
        public string WebClientWithUri(string host)
        {
            string result = "";

            Uri uri = new Uri(host);

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenRead(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ruleid: ssrf
        public string WebClientWithUri2(string host)
        {
            string result = "";

            Uri uri = new Uri(host + "constant");

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenRead(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ok: ssrf
        public string WebClientWithUri(string host)
        {
            string result = "";

            Uri uri = new Uri("constant");

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenRead(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        #endregion

        #region Pattern 3

        // ruleid: ssrf
        public string WebClientAsync(Uri host)
        {
            string result = "";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenReadAsync(host);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ruleid: ssrf
        public string WebClientAsync2(Uri host)
        {
            string result = "";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenReadAsync(host + "constant");
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ok: ssrf
        public string WebClientAsync(Uri host)
        {
            string result = "";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenReadAsync("constant");
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        #endregion

        #region Pattern 4

        // ruleid: ssrf
        public string WebClientAsyncWithUri(string host)
        {
            string result = "";

            Uri uri = new Uri(host + "constant");

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenReadAsync(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ok: ssrf
        public string WebClientAsyncWithUri(string host)
        {
            string result = "";

            Uri uri = new Uri("constant");

            try
            {
                WebClient client = new WebClient();

                Stream data = client.OpenReadAsync(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        #endregion

        #region Pattern 5
        // ruleid: ssrf
        public string WebClientDownloadString(string host)
        {
            string result = "";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.DownloadString(host);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ruleid: ssrf
        public string WebClientDownloadString2(string host)
        {
            string result = "";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.DownloadString(host + "constant");
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ok: ssrf
        public string WebClientDownloadString(string host)
        {
            string result = "";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.DownloadString("constant");
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        #endregion

        #region Pattern 6
        // ruleid: ssrf
        public string WebClientDownloadStringStringConcatenation(string host)
        {
            string result = "";

            string uri = "constant" + host;

            try
            {
                WebClient client = new WebClient();

                Stream data = client.DownloadString(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ok: ssrf
        public string WebClientDownloadStringStringConcatenation(string host)
        {
            string result = "";
            string uri = "constant";

            try
            {
                WebClient client = new WebClient();

                Stream data = client.DownloadString(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ruleid: ssrf
        public string WebClientDownloadStringWithUri(string host)
        {
            string result = "";

            Uri uri = new Uri(host + "constant");

            try
            {
                WebClient client = new WebClient();

                Stream data = client.DownloadString(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        // ok: ssrf
        public string WebClientDownloadStringWithUri(string host)
        {
            string result = "";

            Uri uri = new Uri("constant");

            try
            {
                WebClient client = new WebClient();

                Stream data = client.DownloadString(uri);
                StreamReader reader = new StreamReader(data);
                result = reader.ReadToEnd();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }

            return result;
        }

        #endregion
    }
}
