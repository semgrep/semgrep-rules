public class Bad {
    public void bad_bypass() {
        // ruleid: bypass-tls-verification
        new X509TrustManager() {
            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                return null;
            }

            public void checkClientTrusted(X509Certificate[] certs, String authType) {  }

            public void checkServerTrusted(X509Certificate[] certs, String authType) {  }
        }
    }
}
public class Ok {
    public void ok_bypass() {
        // ok: bypass-tls-verification
        new X509TrustManager() {
            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                return null;
            }

            public void checkClientTrusted(X509Certificate[] certs, String authType) { }

            public void checkServerTrusted(X509Certificate[] certs, String authType) {
                try {
                    checkValidity();
                } catch (Exception e) {
                    throw new CertificateException("Certificate not valid or trusted.");
                }
             }
        }
    }

    public void ok_bypass() {
        // ok: bypass-tls-verification
        new X509TrustManager() {
            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                return null;
            }

            public void checkClientTrusted(X509Certificate[] certs, String authType) { }

            public void checkServerTrusted(X509Certificate[] certs, String authType) {
                try {
                    checkValidity();
                } catch (Exception e) {
                    throw new IllegalArgumentException("Certificate not valid or trusted.");
                }
             }
        }
    }

}
