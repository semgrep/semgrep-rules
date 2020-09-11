class Bad {
    public void bad_disable_old_tls1() {
        //ruleid: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf = new SSLConnectionSocketFactory(
                sslContext,
                new String[] {"TLSv1", "TLSv1.1", "TLSv1.2"},
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public void bad_disable_old_tls2() {
        //ruleid: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf = new SSLConnectionSocketFactory(
                sslContext,
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public void bad_disable_old_tls2() {
        //ruleid: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf = new SSLConnectionSocketFactory(
                sslContext,
                new String[] {"TLSv1", "TLSv1.1", "SSLv3"},
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }
}

class Ok {
    public void ok_disable_old_tls1() {
        //ok: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf = new SSLConnectionSocketFactory(
                sslContext,
                new String[] {"TLSv1.2"},
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public void ok_disable_old_tls2() {
        //ok: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf = new SSLConnectionSocketFactory(
                sslContext,
                new String[] {"TLSv1.2", "TLSv1.3"},
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public void ok_disable_old_tls3() {
        //ok: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf = new SSLConnectionSocketFactory(
                sslContext,
                new String[] {"TLSv1.3"},
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }
}
