public class Example {
    public int foo(String a, int b) {
        if (a == "hello") return 1;
        // This one is not
        if (b == 2) return -1;
        if ("hello" == a) return 2;
    }
}