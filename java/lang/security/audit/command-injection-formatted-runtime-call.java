import java.lang.Runtime;

class Cls {

    public Cls(String input) {
        Runtime r = Runtime.getRuntime();
        // ruleid: command-injection-formatted-runtime-call
        r.exec("/bin/sh -c some_tool" + input);
    }

    public void test1(String input) {
        Runtime r = Runtime.getRuntime();
        // ruleid: command-injection-formatted-runtime-call
        r.loadLibrary(String.format("%s.dll", input));
    }

    public void test2(String input) {
        Runtime r = Runtime.getRuntime();
        // ruleid: command-injection-formatted-runtime-call
        r.exec("bash", "-c", input);
    }

    public void test3(String input) {
        // ruleid: command-injection-formatted-runtime-call
        Runtime.getRuntime().loadLibrary(String.format("%s.dll", input));
    }

    public void test4(String input) {
        // ruleid: command-injection-formatted-runtime-call
        Runtime.getRuntime().exec("bash", "-c", input);
    }

    public void okTest(String input) {
        Runtime r = Runtime.getRuntime();
        // ok: command-injection-formatted-runtime-call
        r.exec("echo 'blah'");
    }

    public void okTest2(String input) {
        // ok: command-injection-formatted-runtime-call
        Runtime.getRuntime().loadLibrary("lib.dll");
    }
}

