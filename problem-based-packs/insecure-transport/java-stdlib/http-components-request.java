class Bad {
    public void bad1() {
        // ruleid: http-components-request
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("http://targethost/homepage");
        CloseableHttpResponse response1 = httpclient.execute(httpGet);
    }

    public void bad2() {
        // ruleid: http-components-request
        CloseableHttpClient httpclient = HttpClients.createDefault();
        System.out.println("hello");
        CloseableHttpResponse response1 = httpclient.execute(new HttpPost("http://example.com"));
    }

    public void bad3() {
        // ruleid: http-components-request
        CloseableHttpClient httpclient = HttpClients.createDefault();
        CloseableHttpResponse response1 = httpclient.execute(new HttpPost("http://example.com"));
    }
}

class Ok {
    public void ok1() {
        // ok: http-components-request
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("https://targethost/homepage");
        CloseableHttpResponse response1 = httpclient.execute(httpGet);
    }

    public void ok2() {
        // ok: http-components-request
        CloseableHttpClient httpclient = HttpClients.createDefault();
        System.out.println("hello");
        CloseableHttpResponse response1 = httpclient.execute(new HttpPost("https://example.com"));
    }

    public void ok3() {
        // ok: http-components-request
        CloseableHttpClient httpclient = HttpClients.createDefault();
        CloseableHttpResponse response1 = httpclient.execute(new HttpPost("https://example.com"));
    }
}
