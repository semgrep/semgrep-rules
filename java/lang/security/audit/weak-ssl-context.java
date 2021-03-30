import java.lang.Runtime;

class Cls {

    public Cls() {
        System.out.println("Hello");
    }

    public void test1() {
        // ruleid: weak-ssl-context
        SSLContext ctx = SSLContext.getInstance("SSL");
    }

    public void test2() {
        // ruleid: weak-ssl-context
        SSLContext ctx = SSLContext.getInstance("TLS");
    }

    public void test3() {
        // ruleid: weak-ssl-context
        SSLContext ctx = SSLContext.getInstance("TLSv1");
    }

    public void test4() {
        // ruleid: weak-ssl-context
        SSLContext ctx = SSLContext.getInstance("SSLv3");
    }

    public void test5() {
        // ruleid: weak-ssl-context
        SSLContext ctx = SSLContext.getInstance("TLSv1.1");
    }

    public void test6() {
        // ok: weak-ssl-context
        SSLContext ctx = SSLContext.getInstance("TLSv1.2");
    }

    public void test7() {
        // ok: weak-ssl-context
        SSLContext ctx = SSLContext.getInstance("TLSv1.3");
    }

    public String getSslContext() {
        return "Anything";
    }

    public void test8() {
        // ok: weak-ssl-context
        SSLContext ctx = SSLContext.getInstance(getSslContext());
    }
}
