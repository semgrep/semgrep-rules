import java.security.*;

public class NoReturnNoException {

    // ruleid: do-privileged-use
    class MyAction implements PrivilegedAction<Void> {
        public Void run() {
            // Privileged code goes here, for example:
            System.loadLibrary("awt");
            return null; // nothing to return
        }
    }

    public void somemethod() {

        MyAction mya = new MyAction();

        // Become privileged:
        // ruleid: do-privileged-use
        AccessController.doPrivileged(mya);

        // Anonymous class
        // ruleid: do-privileged-use
        AccessController.doPrivileged(new PrivilegedAction<Void>() {
            public Void run() {
                // Privileged code goes here, for example:
                System.loadLibrary("awt");
                return null; // nothing to return
            }
        });

        // Lambda expression
        // ruleid: do-privileged-use
        AccessController.doPrivileged((PrivilegedAction<Void>)
            () -> {
                // Privileged code goes here, for example:
                System.loadLibrary("awt");
                return null; // nothing to return
            }
        );
    }

    public static void main(String... args) {
        NoReturnNoException myApplication = new NoReturnNoException();
        myApplication.somemethod();
    }
}
