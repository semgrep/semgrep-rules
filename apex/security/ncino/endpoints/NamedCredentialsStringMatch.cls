/*
 * Test controller with hard-coded credentials in header
 */
public with sharing class NamedCredentialsStringMatch {

	public void calloutWithHardcodedCredentials(String username, String password) {
		HttpRequest req = new HttpRequest();

		Blob headerValue = Blob.valueOf(username + ':' + password);
		String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
		// ruleid: named-credentials-string-match
		req.setHeader('Authorization', authorizationHeader);
		req.setEndpoint('https://www.website.com');

		HTTPResponse res = new Http().send(req);
	}

	public void calloutWithNamedCredential() {
		HttpRequest req = new HttpRequest();

		// ok: named-credentials-string-match
		req.setEndpoint('callout:My_Named_Credential/some_path');

		HTTPResponse res = new Http().send(req);
	}
}
