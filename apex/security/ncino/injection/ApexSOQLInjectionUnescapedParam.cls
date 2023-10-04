public class ApexSOQLInjectionUnescapedParam {
	public void test1(String t1) {
		// ruleid: soql-injection-unescaped-param
		Database.query('SELECT Id FROM Account' + t1);
	}

	public void test2(String t1) {
		String t2 = t1;
		// ruleid: soql-injection-unescaped-param
		Database.query('SELECT Id FROM Account' + t2);
	}

	public void test3(String t1) {
		String escapedStr = String.escapeSingleQuotes(t1);
		// ok: soql-injection-unescaped-param
		Database.query('SELECT Id FROM Account' + escapedStr);
	}

	public void test4(String t1) {
		String t2 = t1;
		String escapedStr = String.escapeSingleQuotes(t2);
		// ok: soql-injection-unescaped-param
		Database.query('SELECT Id FROM Account' + escapedStr);
	}

	public void test5(Integer t0, String t1, Integer t2) {
		// ruleid: soql-injection-unescaped-param
		Database.query('SELECT Id FROM Account' + t1);
	}

	public void test6(Integer t0, String t1, Integer t2) {
		String t2 = t1;
		// ruleid: soql-injection-unescaped-param
		Database.query('SELECT Id FROM Account' + t2);
	}

	public void test7(Integer t0, String t1, Integer t2) {
		String escapedStr = String.escapeSingleQuotes(t1);
		// ok: soql-injection-unescaped-param
		Database.query('SELECT Id FROM Account' + escapedStr);
	}

	public void test8(Integer t0, String t1, Integer t2) {
		String t2 = t1;
		String escapedStr = String.escapeSingleQuotes(t2);
		// ok: soql-injection-unescaped-param
		Database.query('SELECT Id FROM Account' + escapedStr);
	}

	@AuraEnabled(Cacheable=true)
	public static List<SomeObject> findObjects(String objectName, String searchKey) {
		// ok: soql-injection-unescaped-param
		List<SObject> results = Database.query(
			'SELECT Id, Name ' +
				'FROM ' + objectName + ' ' +
				'WHERE Name LIKE \'%' + String.escapeSingleQuotes(searchKey) + '%\' ' +
				'WITH SECURITY_ENFORCED ' +
				'LIMIT 25'
		);

		return results;
	}
}
