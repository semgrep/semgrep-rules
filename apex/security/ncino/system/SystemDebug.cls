/*
A test controller containing a debug log.
*/
public class SystemDebug {
	public static void debugMethod() {
		// ruleid: system-debug
		System.debug('foo');
	}

	public static void noDebugMethod() {
		insert new Object();
	}
}
