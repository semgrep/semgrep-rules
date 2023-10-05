public class AvoidSoslLoops {
	public void SoslInsideLoop() {
		for (Integer i = 0; i < 151; i++) {
			// ruleid: avoid-sosl-in-loops
			List<Object> objects = (List<Object>) Search.query(
				'soslString'
			)[0];
			// ruleid: avoid-sosl-in-loops
			List<List<SObject>> searchList = [FIND 'map*' IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity, Lead];
		}
	}

	public void SoslInsideLoop2() {
		for (Account a : accounts) {
			// ruleid: avoid-sosl-in-loops
			Object[] objects = (Object[]) Search.query(
				'soslString'
			)[0];
			// ruleid: avoid-sosl-in-loops
			List<List<SObject>> searchList = [FIND 'map*' IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity, Lead];
		}
	}

	public void SoslInsideLoop3() {
		while (someCondition) {
			// ruleid: avoid-sosl-in-loops
			List<Object> objects = (List<Object>) Search.query(
				'soslString'
			)[0];
			// ruleid: avoid-sosl-in-loops
			List<List<SObject>> searchList = [FIND 'map*' IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity, Lead];
		}
	}

	public void SoslInsideLoop4() {
		do {
			// ruleid: avoid-sosl-in-loops
			Object[] objects = (Object[]) Search.query(
				'soslString'
			)[0];
			// ruleid: avoid-sosl-in-loops
			List<List<SObject>> searchList = [FIND 'map*' IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity, Lead];
		} while (someCondition);
	}
}
