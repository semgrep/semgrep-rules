/*
 * Test controller utilizing unescaped URL params
 */
public class ApexSOQLInjectionFromUnescapedURLParam {

	public void test1() {
		String unescapedString = ApexPage.getCurrentPage().getParameters.get('url_param');
		// ruleid: soql-injection-unescaped-url-param
		Database.query('SELECT Id FROM Account' + unescapedString);
	}

	public void test2() {
		String unescapedString = ApexPage.getCurrentPage().getParameters.get('url_param');
		String someQueryClause = someOtherString + unescapedString;
		// ruleid: soql-injection-unescaped-url-param
		Database.query('SELECT Id FROM Account' + someQueryClause);
	}

	public void test3() {
		String unescapedString = ApexPage.getCurrentPage().getParameters.get('url_param');
		String escapedString = String.escapeSingleQuotes(unescapedString);
		// ok: soql-injection-unescaped-url-param
		Database.query('SELECT Id FROM Account' + escapedString);
	}

	public void test4() {
		String unescapedString = ApexPage.getCurrentPage().getParameters.get('url_param');
		String escapedString = String.escapeSingleQuotes(unescapedString);
		String someQueryClause = someOtherString + escapedString;
		// ok: soql-injection-unescaped-url-param
		Database.query('SELECT Id FROM Account' + someQueryClause);
	}

	public void test5() {
		String unescapedString = ApexPage.getCurrentPage().getParameters.get('url_param');
		// ok: soql-injection-unescaped-url-param
		Database.query('SELECT Id FROM Account' + String.escapeSingleQuotes(unescapedString));
	}
}
