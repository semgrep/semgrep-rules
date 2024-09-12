public class AvoidNativeDmlInLoops {
	public void insertInsideLoop() {
		for (Integer i = 0; i < 151; i++) {
			// ruleid: avoid-native-dml-in-loops
			insert account;
			// ruleid: avoid-native-dml-in-loops
			Database.insert(a);
		}
	}

	public void insertInsideLoop2() {
		for (Account a : accounts) {
			// ruleid: avoid-native-dml-in-loops
			insert account;
			// ruleid: avoid-native-dml-in-loops
			Database.insert(a);
		}
	}

	public void insertInsideLoop3() {
		while (someCondition) {
			// ruleid: avoid-native-dml-in-loops
			insert account;
			// ruleid: avoid-native-dml-in-loops
			Database.insert(a);
		}
	}

	public void insertInsideLoop4() {
		do {
			// ruleid: avoid-native-dml-in-loops
			insert account;
			// ruleid: avoid-native-dml-in-loops
			Database.insert(a);
		} while (someCondition);
	}

	public void updateInsideLoop() {
		for (Integer i = 0; i < 151; i++) {
			// ruleid: avoid-native-dml-in-loops
			update account;
			// ruleid: avoid-native-dml-in-loops
			Database.update(a);
		}
	}

	public void updateInsideLoop2() {
		for (Account a : accounts) {
			// ruleid: avoid-native-dml-in-loops
			update account;
			// ruleid: avoid-native-dml-in-loops
			Database.update(a);
		}
	}

	public void updateInsideLoop3() {
		while (someCondition) {
			// ruleid: avoid-native-dml-in-loops
			update account;
			// ruleid: avoid-native-dml-in-loops
			Database.update(a);
		}
	}

	public void updateInsideLoop4() {
		do {
			// ruleid: avoid-native-dml-in-loops
			update account;
			// ruleid: avoid-native-dml-in-loops
			Database.update(a);
		} while (someCondition);
	}

	public void upsertInsideLoop() {
		for (Integer i = 0; i < 151; i++) {
			// ruleid: avoid-native-dml-in-loops
			upsert account;
			// ruleid: avoid-native-dml-in-loops
			Database.upsert(a);
		}
	}

	public void upsertInsideLoop2() {
		for (Account a : accounts) {
			// ruleid: avoid-native-dml-in-loops
			upsert account;
			// ruleid: avoid-native-dml-in-loops
			Database.upsert(a);
		}
	}

	public void upsertInsideLoop3() {
		while (someCondition) {
			// ruleid: avoid-native-dml-in-loops
			upsert account;
			// ruleid: avoid-native-dml-in-loops
			Database.upsert(a);
		}
	}

	public void upsertInsideLoop4() {
		do {
			// ruleid: avoid-native-dml-in-loops
			upsert account;
			// ruleid: avoid-native-dml-in-loops
			Database.upsert(a);
		} while (someCondition);
	}

	public void deleteInsideLoop() {
		for (Integer i = 0; i < 151; i++) {
			// ruleid: avoid-native-dml-in-loops
			delete account;
			// ruleid: avoid-native-dml-in-loops
			Database.delete(a);
		}
	}

	public void deleteInsideLoop2() {
		for (Account a : accounts) {
			// ruleid: avoid-native-dml-in-loops
			delete account;
			// ruleid: avoid-native-dml-in-loops
			Database.delete(a);
		}
	}

	public void deleteInsideLoop3() {
		while (someCondition) {
			// ruleid: avoid-native-dml-in-loops
			delete account;
			// ruleid: avoid-native-dml-in-loops
			Database.delete(a);
		}
	}

	public void deleteInsideLoop4() {
		do {
			// ruleid: avoid-native-dml-in-loops
			delete account;
			// ruleid: avoid-native-dml-in-loops
			Database.delete(a);
		} while (someCondition);
	}

}
