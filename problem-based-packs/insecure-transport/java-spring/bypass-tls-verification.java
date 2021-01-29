public class Bad {
    public void bad1() {
        // ruleid: bypass-tls-verification
        HttpsURLConnection.setDefaultHostnameVerifier(new HostnameVerifier() {
                public boolean verify(String hostname, SSLSession session) {
                    return true;
                }
            });
    }

    // ruleid: bypass-tls-verification
    public RestTemplate restTemplate()
                        throws KeyStoreException, NoSuchAlgorithmException, KeyManagementException {
            TrustStrategy acceptingTrustStrategy = (X509Certificate[] chain, String authType) -> true;

            SSLContext sslContext = org.apache.http.ssl.SSLContexts.custom()
                            .loadTrustMaterial(null, acceptingTrustStrategy)
                            .build();

            SSLConnectionSocketFactory csf = new SSLConnectionSocketFactory(sslContext);

            CloseableHttpClient httpClient = HttpClients.custom()
                            .setSSLSocketFactory(csf)
                            .build();

            HttpComponentsClientHttpRequestFactory requestFactory =
                            new HttpComponentsClientHttpRequestFactory();

            requestFactory.setHttpClient(httpClient);
            RestTemplate restTemplate = new RestTemplate(requestFactory);
            return restTemplate;
    }

    public RestTemplate getRestTemplate() throws KeyStoreException, NoSuchAlgorithmException, KeyManagementException {
        // ruleid: bypass-tls-verification
        TrustStrategy acceptingTrustStrategy = new TrustStrategy() {
            @Override
            public boolean isTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
                return true;
            }
        };
        SSLContext sslContext = org.apache.http.ssl.SSLContexts.custom().loadTrustMaterial(null, acceptingTrustStrategy).build();
        SSLConnectionSocketFactory csf = new SSLConnectionSocketFactory(sslContext, new NoopHostnameVerifier());
        CloseableHttpClient httpClient = HttpClients.custom().setSSLSocketFactory(csf).build();
        HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
        requestFactory.setHttpClient(httpClient);
        RestTemplate restTemplate = new RestTemplate(requestFactory);
        return restTemplate;
    }
}
