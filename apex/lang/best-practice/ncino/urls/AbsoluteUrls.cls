/*
 * Test Controller with Absolute URLs
 */
public with sharing class AbsoluteUrls {

	public PageReference absoluteSalesforceUrlExample() {
		// ruleid: absolute-urls
		String strUrl = 'https://na8.salesforce.com/TestVFPage?AccountId=999';
		PageReference newUrl = new PageReference(strUrl);
		newURL.setRedirect(true);

		return newURL;
	}

	public PageReference absoluteNonSalesforceUrlExample() {
		// ok: absolute-urls
		String strUrl = 'https://www.website.com';
		PageReference newUrl = new PageReference(strUrl);
		newURL.setRedirect(true);

		return newURL;
	}

	public PageReference nonAbsoluteSalesforceUrlExample() {
		// ok: absolute-urls
		String strUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/TestVFPage?AccountId=999';
		PageReference newUrl = new PageReference(strUrl);
		newURL.setRedirect(true);

		return newURL;
	}

	// Absolute Salesforce URL comment example
	// ruleid: absolute-urls
	// https://na8.salesforce.com/TestVFPage?AccountId=999

	// Absolute non-Salesforce URL comment example
	// ok: absolute-urls
	// https://www.website.com

	// Non-absolute Salesforce URL comment example
	// ok: absolute-urls
	// URL.getSalesforceBaseUrl().toExternalForm() + '/TestVFPage?AccountId=999

	// ruleid: absolute-urls
	private static final String ABSOLUTE_SF_URL_CONSTANT = 'https://na8.salesforce.com/TestVFPage?AccountId=999';
	// ok: absolute-urls
	private static final String ABSOLUTE_NON_SF_URL_CONSTANT = 'https://www.website.com';
	// ok: absolute-urls
	private static final String NON_ASBOLUTE_SF_URL_CONSTANT = URL.getOrgDomainUrl().toExternalForm() + '/TestVFPage?AccountId=999';
}
