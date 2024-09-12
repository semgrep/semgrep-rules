/*
 * A test controller containing http requests.
 * Javadoc insecure endpoint comment test:
 * http://www.website.com
 * Javadoc secure endpoint comment test:
 * https://www.website.com
 */
public with sharing class InsecureHttpRequest {

	// Test comment with insecure endpoint in it
	// (comments shouldn't be flagged regardless)
	// ok: insecure-http-request
	// http://www.website.com
	public static void insecureRequestMethod() {
		HttpRequest req = new HttpRequest();
		// ruleid: insecure-http-request
		req.setEndpoint('http://www.website.com');
	}

	// Test comment with secure endpoint in it
	// (comments shouldn't be flagged regardless)
	// ok: insecure-http-request
	// https://www.website.com
	public static void secureRequestMethod() {
		HttpRequest req = new HttpRequest();
		// ok: insecure-http-request
		req.setEndpoint('https://www.website.com');
	}

	public static void httpRequestUsingLifeCycleCommunicatorConfigObject() {
		Communication_Provider__c insecureCommunicator = new Communication_Provider__c(
			Name = MY_COMMUNICATOR,
			// ruleid: insecure-http-request
			Destination__c = 'http://www.website.com',
			Billable__c = true,
			IsActive__c = true,
			Class_Name__c = LifeCycleOAuth2Communicator.class.getName()
		);

		Communication_Provider__c secureCommunicator = new Communication_Provider__c(
			Name = MY_COMMUNICATOR,
			// ok: insecure-http-request
			Destination__c = 'https://www.website.com',
			Billable__c = true,
			IsActive__c = true,
			Class_Name__c = LifeCycleOAuth2Communicator.class.getName()
		);
	}

	// ruleid: insecure-http-request
	private static final String insecureEndpoint = 'http://www.website.com';
	// ok: insecure-http-request
	private static final String secureEndpoint = 'https://www.website.com';
}
