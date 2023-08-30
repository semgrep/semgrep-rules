/*
 * global javadoc
 * javadoc with global in it
 * javadoc global
 */
// ruleid: apex.accessModifiers.global-access-modifiers
global without sharing class GlobalAccessModifiers {
	// ruleid: apex.accessModifiers.global-access-modifiers
	global String globalInstanceVariable = 'globalInstanceVariable';

	// ok: apex.accessModifiers.global-access-modifiers
	public String publicInstanceVariable = 'publicInstanceVariable';

	// ok: apex.accessModifiers.global-access-modifiers
	private String privateInstanceVariable = 'privateInstanceVariable';

	// ok: apex.accessModifiers.global-access-modifiers
	// This is a test comment that has the word global in it
	// ruleid: apex.accessModifiers.global-access-modifiers
	global static void myGlobalMethod() { }

	// ok: apex.accessModifiers.global-access-modifiers
	public static void myPublicMethod() { }

	// ok: apex.accessModifiers.global-access-modifiers
	private static void myPrivateMethod() { }

	// ok: apex.accessModifiers.global-access-modifiers
	// This is another test comment with global
	// ruleid: apex.accessModifiers.global-access-modifiers
	global with sharing class TestGlobalClass { }

	// ok: apex.accessModifiers.global-access-modifiers
	public with sharing class TestPublicClass { }

	// ok: apex.accessModifiers.global-access-modifiers
	private without sharing class SystemMode { }

	// ok: apex.accessModifiers.global-access-modifiers
	// Global test comment - last one
	// ruleid: apex.accessModifiers.global-access-modifiers
	global static String globalStaticVariable = 'globalStaticVariable';

	// ok: apex.accessModifiers.global-access-modifiers
	public static String publicStaticVariable = 'publicStaticVariable';

	// ok: apex.accessModifiers.global-access-modifiers
	private static String privateStaticVariable = 'privateStaticVariable';
}
