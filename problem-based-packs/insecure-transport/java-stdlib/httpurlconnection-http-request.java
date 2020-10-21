class Bad {
    private static void sendbad1() throws IOException {
            // ruleid: httpurlconnection-http-request
            URL obj = new URL("http://example.com");
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", USER_AGENT);
            int responseCode = con.getResponseCode();
            con.connect();
    }

    private static void sendbad2() throws IOException {
            // ruleid: httpurlconnection-http-request
            String url = "http://example.com";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", USER_AGENT);
            int responseCode = con.getResponseCode();
            con.connect();
    }

    public static void sendbad3() throws IOException {
            // ruleid: httpurlconnection-http-request
            String url = "http://example.com";
            URL urlObj = new URL(url);
            URLConnection urlCon = urlObj.openConnection();
            InputStream inputStream = urlCon.getInputStream();
    }

    public static void sendbad4() throws IOException {
            // ruleid: httpurlconnection-http-request
            URL urlObj = new URL("http://example.com");
            URLConnection urlCon = urlObj.openConnection();
            int responseCode = urlCon.getResponseCode();
    }
}

public class Ok {
    private static void sendok1() throws IOException {
            // ok: httpurlconnection-http-request
            URL obj = new URL("https://example.com");
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", USER_AGENT);
            int responseCode = con.getResponseCode();
            con.connect();
    }

    private static void sendok2() throws IOException {
            // ok: httpurlconnection-http-request
            String url = "https://example.com";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", USER_AGENT);
            int responseCode = con.getResponseCode();
            con.connect();
    }

    public static void sendok3() throws IOException {
            // ok: httpurlconnection-http-request
            String url = "https://example.com";
            URL urlObj = new URL(url);
            URLConnection urlCon = urlObj.openConnection();
            InputStream inputStream = urlCon.getInputStream();
    }

    public static void sendok4() throws IOException {
            // ok: httpurlconnection-http-request
            URL urlObj = new URL("https://example.com");
            URLConnection urlCon = urlObj.openConnection();
            int responseCode = urlCon.getResponseCode();
    }
}
