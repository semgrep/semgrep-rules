// ruleid: specify-sharing-level
global class SpecifySharingLevel {
	// ruleid: specify-sharing-level
	public class InnerClass {
		public void foo(){
		}
	}

	// ruleid: specify-sharing-level
	public abstract class InnerClass2 {
		public void foo(){
		}
	}

	// ruleid: specify-sharing-level
	private virtual class InnerClass3 {
		public void foo(){
		}
	}

	// ok: specify-sharing-level
	public inherited sharing class OtherInnerClass {
		private void bar(){
		}
	}

	// ok: specify-sharing-level
	public class SomeExceptionClass extends Exception {
	}

	// ok: specify-sharing-level
	public with sharing abstract class InnerClass2 {
		public void foo(){
		}
	}

	// ok: specify-sharing-level
	private inherited sharing virtual class InnerClass3 {
		public void foo(){
		}
	}

	// ok: specify-sharing-level
	public inherited sharing virtual class InnerClass3 extends AnotherClass {
		public void foo(){
		}
	}

	// Observed False Positive
	// ok: specify-sharing-level
	global virtual override Type forName(String className) {
		return Type.forName(className);
	}
}
