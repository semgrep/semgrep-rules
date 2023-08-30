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
	// ok: apex.endpoints.insecure-http-request
	// http://www.website.com
	public static void insecureRequestMethod() {
		HttpRequest req = new HttpRequest();
		// ruleid: apex.endpoints.insecure-http-request
		req.setEndpoint('http://www.website.com');
	}

	// Test comment with secure endpoint in it
	// (comments shouldn't be flagged regardless)
	// ok: apex.endpoints.insecure-http-request
	// https://www.website.com
	public static void secureRequestMethod() {
		HttpRequest req = new HttpRequest();
		// ok: apex.endpoints.insecure-http-request
		req.setEndpoint('https://www.website.com');
	}

	public static void httpRequestUsingLifeCycleCommunicatorConfigObject() {
		Communication_Provider__c insecureCommunicator = new Communication_Provider__c(
			Name = MY_COMMUNICATOR,
			// ruleid: apex.endpoints.insecure-http-request
			Destination__c = 'http://www.website.com',
			Billable__c = true,
			IsActive__c = true,
			Class_Name__c = LifeCycleOAuth2Communicator.class.getName()
		);

		Communication_Provider__c secureCommunicator = new Communication_Provider__c(
			Name = MY_COMMUNICATOR,
			// ok: apex.endpoints.insecure-http-request
			Destination__c = 'https://www.website.com',
			Billable__c = true,
			IsActive__c = true,
			Class_Name__c = LifeCycleOAuth2Communicator.class.getName()
		);
	}

	// ruleid: apex.endpoints.insecure-http-request
	private static final String insecureEndpoint = 'http://www.website.com';
	// ok: apex.endpoints.insecure-http-request
	private static final String secureEndpoint = 'https://www.website.com';
}
