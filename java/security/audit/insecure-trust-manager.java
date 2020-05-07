package Trust;

import java.security.KeyStore;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import javax.net.ssl.X509TrustManager;

//cf. https://find-sec-bugs.github.io/bugs.htm#WEAK_TRUST_MANAGER
public class TrustAllManager implements X509TrustManager {

    // ruleid:insecure-trust-manager
    @Override
    public void checkClientTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
        //Trust any client connecting (no certificate validation)
    }

    // ruleid:insecure-trust-manager
    @Override
    public void checkServerTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
        //Trust any remote server (no certificate validation)
    }

    // ruleid:insecure-trust-manager
    @Override
    public X509Certificate[] getAcceptedIssuers() {
        return null;
    }
}

public class GoodTrustManager implements X509TrustManager {

    protected KeyStore loadKeyStore() {
        KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
        return ks;
    }

    // ok
    @Override
    public void checkClientTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
        KeyStore ks = loadKeyStore();
        TrustManagerFactory tmf = TrustManagerFactory.getInstance("SunX509");
        tmf.init(ks);
        tmf.getTrustManagers[0].checkClientTrusted(x509Certificates, s);
    }

    // ok
    @Override
    public void checkServerTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
        KeyStore ks = loadKeyStore();
        TrustManagerFactory tmf = TrustManagerFactory.getInstance("SunX509");
        tmf.init(ks);
        tmf.getTrustManagers[0].checkClientTrusted(x509Certificates, s);
    }

    // ok
    @Override
    public X509Certificate[] getAcceptedIssuers() {
        return loadKeyStore().getCertificate("alias");
    }
}