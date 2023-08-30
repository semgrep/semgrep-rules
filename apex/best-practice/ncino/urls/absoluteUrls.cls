/*
 * Test Controller with Absolute URLs
 */
public with sharing class AbsoluteUrls {

	public PageReference absoluteSalesforceUrlExample() {
		// ruleid: apex.urls.absolute-urls
		String strUrl = 'https://na8.salesforce.com/TestVFPage?AccountId=999';
		PageReference newUrl = new PageReference(strUrl);
		newURL.setRedirect(true);

		return newURL;
	}

	public PageReference absoluteNonSalesforceUrlExample() {
		// ok: apex.urls.absolute-urls
		String strUrl = 'https://www.website.com';
		PageReference newUrl = new PageReference(strUrl);
		newURL.setRedirect(true);

		return newURL;
	}

	public PageReference nonAbsoluteSalesforceUrlExample() {
		// ok: apex.urls.absolute-urls
		String strUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/TestVFPage?AccountId=999';
		PageReference newUrl = new PageReference(strUrl);
		newURL.setRedirect(true);

		return newURL;
	}

	// Absolute Salesforce URL comment example
	// ruleid: apex.urls.absolute-urls
	// https://na8.salesforce.com/TestVFPage?AccountId=999

	// Absolute non-Salesforce URL comment example
	// ok: apex.urls.absolute-urls
	// https://www.website.com

	// Non-absolute Salesforce URL comment example
	// ok: apex.urls.absolute-urls
	// URL.getSalesforceBaseUrl().toExternalForm() + '/TestVFPage?AccountId=999

	// ruleid: apex.urls.absolute-urls
	private static final String ABSOLUTE_SF_URL_CONSTANT = 'https://na8.salesforce.com/TestVFPage?AccountId=999';
	// ok: apex.urls.absolute-urls
	private static final String ABSOLUTE_NON_SF_URL_CONSTANT = 'https://www.website.com';
	// ok: apex.urls.absolute-urls
	private static final String NON_ASBOLUTE_SF_URL_CONSTANT = URL.getOrgDomainUrl().toExternalForm() + '/TestVFPage?AccountId=999';
}
