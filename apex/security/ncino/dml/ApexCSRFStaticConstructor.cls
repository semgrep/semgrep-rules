/*
 * Test Controller with DML in constuctors
 */
public class ApexCSRFStaticConstructor {

	static {
		// ruleid: apex.dml.apex-csrf-static-constructor
		insert data;
	}

	static {
		// ruleid: apex.dml.apex-csrf-static-constructor
		update data;
	}

	static {
		// ruleid: apex.dml.apex-csrf-static-constructor
		upsert data;
	}

	static {
		// ruleid: apex.dml.apex-csrf-static-constructor
		delete data;
	}

	static {
		// ok: apex.dml.apex-csrf-static-constructor
		notADmlCall();
	}
}
