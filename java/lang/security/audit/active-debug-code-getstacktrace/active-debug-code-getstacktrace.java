public class ActiveDebugCode{

    public void bad(){
        StackTraceElement[] elements;

        Exception e = new Exception();
        elements = e.getStackTrace();

        // ruleid: active-debug-code-getstacktrace
        System.err.print(elements);
    }

    public void bad2(){
        StackTraceElement[] elements;

        elements = Thread.currentThread().getStackTrace();

        // ruleid: active-debug-code-getstacktrace
        System.err.print(elements);
    }

    public void bad3(){
        StackTraceElement[] elements;

        elements = new Throwable().getStackTrace();

        // ruleid: active-debug-code-getstacktrace
        System.err.print(elements);
    }

    public void bad4(){
        // ruleid: active-debug-code-getstacktrace
        System.out.println(org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(e));
        // ruleid: active-debug-code-getstacktrace
        System.out.println(org.apache.commons.lang3.exception.ExceptionUtils.getFullStackTrace(e));
    }

    public void alsobad(){
        for (StackTraceElement ste : Thread.currentThread().getStackTrace()) {
            // ruleid: active-debug-code-getstacktrace
            System.out.println(ste);
        }
    }

}
