/*
 * global javadoc
 * javadoc with global in it
 * javadoc global
 */
// ruleid: global-access-modifiers
global without sharing class GlobalAccessModifiers {
	// ruleid: global-access-modifiers
	global String globalInstanceVariable = 'globalInstanceVariable';

	// ok: global-access-modifiers
	public String publicInstanceVariable = 'publicInstanceVariable';

	// ok: global-access-modifiers
	private String privateInstanceVariable = 'privateInstanceVariable';

	// ok: global-access-modifiers
	// This is a test comment that has the word global in it
	// ruleid: global-access-modifiers
	global static void myGlobalMethod() { }

	// ok: global-access-modifiers
	public static void myPublicMethod() { }

	// ok: global-access-modifiers
	private static void myPrivateMethod() { }

	// ok: global-access-modifiers
	// This is another test comment with global
	// ruleid: global-access-modifiers
	global with sharing class TestGlobalClass { }

	// ok: global-access-modifiers
	public with sharing class TestPublicClass { }

	// ok: global-access-modifiers
	private without sharing class SystemMode { }

	// ok: global-access-modifiers
	// Global test comment - last one
	// ruleid: global-access-modifiers
	global static String globalStaticVariable = 'globalStaticVariable';

	// ok: global-access-modifiers
	public static String publicStaticVariable = 'publicStaticVariable';

	// ok: global-access-modifiers
	private static String privateStaticVariable = 'privateStaticVariable';
}
