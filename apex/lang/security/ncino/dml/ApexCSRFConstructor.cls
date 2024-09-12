/*
 * Test Controller with DML in constuctors
 */
public class ApexCSRFConstructor {

	public ApexCSRFConstructor() {
		// ruleid: apex-csrf-constructor
		insert data;
	}

	private ApexCSRFConstructor() {
		// ruleid: apex-csrf-constructor
		insert data;
	}

	public ApexCSRFConstructor() {
		// ruleid: apex-csrf-constructor
		update data;
	}

	private ApexCSRFConstructor() {
		// ruleid: apex-csrf-constructor
		update data;
	}

	public ApexCSRFConstructor() {
		// ruleid: apex-csrf-constructor
		upsert data;
	}

	private ApexCSRFConstructor() {
		// ruleid: apex-csrf-constructor
		upsert data;
	}

	public ApexCSRFConstructor() {
		// ruleid: apex-csrf-constructor
		delete data;
	}

	private ApexCSRFConstructor() {
		// ruleid: apex-csrf-constructor
		delete data;
	}

	public ApexCSRFConstructor() {
		// ok: apex-csrf-constructor
		notADmlCall();
	}

	private ApexCSRFConstructor() {
		// ok: apex-csrf-constructor
		notADmlCall();
	}
}
