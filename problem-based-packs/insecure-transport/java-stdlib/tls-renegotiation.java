class Bad {
    public void bad1() {
        // ruleid: tls-renegotiation
        java.lang.System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", true);
    }
}

class Ok {
    public void ok1() {
        // ok: tls-renegotiation
        java.lang.System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", false);
    }
}
