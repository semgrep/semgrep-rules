public class AvoidSoqlInLoops {
	public void SoqlInsideLoop() {
		for (Integer i = 0; i < 151; i++) {
			// ruleid: avoid-soql-in-loops
			List<Account> accounts = [SELECT Id FROM Account];
			// ruleid: avoid-soql-in-loops
			Account[] accounts = [SELECT Id FROM Account];
		}
	}

	public void SoqlInsideLoop2() {
		for (Account a : accounts) {
			// ruleid: avoid-soql-in-loops
			List<Account> accounts = [SELECT Id FROM Account];
			// ruleid: avoid-soql-in-loops
			Account[] accounts = [SELECT Id FROM Account];
		}
	}

	public void SoqlInsideLoop5() {
		while (someCondition) {
			// ruleid: avoid-soql-in-loops
			List<Account> accounts = [SELECT Id FROM Account];
			// ruleid: avoid-soql-in-loops
			Account[] accounts = [SELECT Id FROM Account];
		}
	}

	public void SoqlInsideLoop7() {
		do {
			// ruleid: avoid-soql-in-loops
			List<Account> accounts = [SELECT Id FROM Account];
			// ruleid: avoid-soql-in-loops
			Account[] accounts = [SELECT Id FROM Account];
		} while (someCondition);
	}
}
