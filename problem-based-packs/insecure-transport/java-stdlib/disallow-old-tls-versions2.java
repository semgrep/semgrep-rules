public class Bad {
    public void bad1() {
        // ruleid: disallow-old-tls-versions2
        java.lang.System.setProperty("jdk.tls.client.protocols", "TLSv1.2,TLSv1.3,TLS1");
    }
    public void bad1() {
        // ruleid: disallow-old-tls-versions2
        java.lang.System.setProperty("jdk.tls.client.protocols", "TLSv1.2,TLSv1.3,SSLv3");
    }
}

public class Ok {
    public void bad1() {
        // ok: disallow-old-tls-versions2
        java.lang.System.setProperty("jdk.tls.client.protocols", "TLSv1.2,TLSv1.3");
    }
    public void bad1() {
        // ok: disallow-old-tls-versions2
        java.lang.System.setProperty("jdk.tls.client.protocols", "TLSv1.3");
    }
}
