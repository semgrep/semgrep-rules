// ruleid: apex.sharing.specify-sharing-level
global class SpecifySharingLevel {
	// ruleid: apex.sharing.specify-sharing-level
	public class InnerClass {
		public void foo(){
		}
	}

	// ruleid: apex.sharing.specify-sharing-level
	public abstract class InnerClass2 {
		public void foo(){
		}
	}

	// ruleid: apex.sharing.specify-sharing-level
	private virtual class InnerClass3 {
		public void foo(){
		}
	}

	// ok: apex.sharing.specify-sharing-level
	public inherited sharing class OtherInnerClass {
		private void bar(){
		}
	}

	// ok: apex.sharing.specify-sharing-level
	public class SomeExceptionClass extends Exception {
	}

	// ok: apex.sharing.specify-sharing-level
	public with sharing abstract class InnerClass2 {
		public void foo(){
		}
	}

	// ok: apex.sharing.specify-sharing-level
	private inherited sharing virtual class InnerClass3 {
		public void foo(){
		}
	}

	// ok: apex.sharing.specify-sharing-level
	public inherited sharing virtual class InnerClass3 extends AnotherClass {
		public void foo(){
		}
	}

	// Observed False Positive
	// ok: apex.sharing.specify-sharing-level
	global virtual override Type forName(String className) {
		return Type.forName(className);
	}
}
