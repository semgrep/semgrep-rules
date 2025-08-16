public class ActiveDebugCode{


    public void bad(){
        Exception e = new Exception();
        // ruleid: active-debug-code-printstacktrace
        e.printStackTrace();

        // ruleid: active-debug-code-printstacktrace
        Thread.currentThread().printStackTrace();

        // ruleid: active-debug-code-printstacktrace
        printStackTrace();

        // ruleid: active-debug-code-printstacktrace
        new Throwable().printStackTrace();

        // ruleid: active-debug-code-printstacktrace
        org.apache.commons.lang3.exception.ExceptionUtils.printStackTrace(e);

    }


}
