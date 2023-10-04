/*
 * Test controller with hard-coded credentials in header
 */
public with sharing class NamedCredentialsConstantMatch {

	public void calloutWithHardcodedCredentials() {
		HttpRequest req = new HttpRequest();

		Blob headerValue = Blob.valueOf('someUsername:somePasswod');
		String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
		// ruleid: named-credentials-constant-match
		req.setHeader(AUTHORIZATION_HEADER, authorizationHeader);
		req.setEndpoint('https://www.website.com');

		HTTPResponse res = new Http().send(req);
	}

	public void calloutWithNamedCredential() {
		HttpRequest req = new HttpRequest();

		// ok: named-credentials-constant-match
		req.setEndpoint('callout:My_Named_Credential/some_path');

		HTTPResponse res = new Http().send(req);
	}

	public static final String AUTHORIZATION_HEADER = 'Authorization';
}
