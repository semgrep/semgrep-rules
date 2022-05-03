package org.sasanlabs.service.vulnerability.openRedirect;

import static org.sasanlabs.vulnerability.utils.Constants.NULL_BYTE_CHARACTER;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Function;
import org.sasanlabs.internal.utility.FrameworkConstants;
import org.sasanlabs.internal.utility.LevelConstants;
import org.sasanlabs.internal.utility.annotations.AttackVector;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRequestMapping;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRestController;
import org.sasanlabs.vulnerability.types.VulnerabilityType;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * This class contains the vulnerabilities related to Open Redirects. Redirects implemented by this
 * class are based on {@code HTTP 3xx Status Codes}. <br>
 * Important Links: <br>
 * 1. <a href= "http://projects.webappsec.org/w/page/13246981/URL%20Redirector%20Abuse">WASC-38</a>
 * <br>
 * 2. <a href="https://cwe.mitre.org/data/definitions/601.html">CWE-601</a><br>
 * 3. <a href= "https://portswigger.net/kb/issues/00500100_open-redirection-reflected">Port
 * Swigger's vulnerability documentation</a><br>
 * 4. <a href="https://en.wikipedia.org/wiki/URL_redirection">Wiki link for describing the purpose
 * of URL Redirection</a><br>
 * 5. <a href="https://github.com/payloadbox/open-redirect-payload-list">Payloads for Open
 * Redirect</a><br>
 * <br>
 * Some myths: <a href=
 * "https://security.stackexchange.com/questions/59517/are-url-shorteners-vulnerable-due-to-open-redirects">Are
 * URL shorteners “vulnerable” due to open redirects? </a><br>
 * <br>
 * Note: as we have implemented entire architecture around the Ajax calls hence there is no direct
 * way to provide the User Interface for URL Redirect Vulnerability hence these will be exposed as
 * an API and user can follow instructions suggested in UI for exploiting this Vulnerability.
 *
 * @author KSASAN preetkaran20@gmail.com
 */
@VulnerableAppRestController(
        descriptionLabel = "OPEN_REDIRECTION_VULNERABILITY_3XX_BASED",
        value = "Http3xxStatusCodeBasedInjection")
public class Http3xxStatusCodeBasedInjection {

    private static final String LOCATION_HEADER_KEY = "Location";
    private static final String RETURN_TO = "returnTo";
    private static final Set<String> WHITELISTED_URLS = new HashSet<>(Arrays.asList("/"));

    private ResponseEntity<?> getURLRedirectionResponseEntity(
            String urlToRedirect, Function<String, Boolean> validator) {
        MultiValueMap<String, String> headerParam = new HttpHeaders();
        if (validator.apply(urlToRedirect)) {
            headerParam.put(LOCATION_HEADER_KEY, new ArrayList<>());
            // ruleid: nonconstant-location-header
            headerParam.get(LOCATION_HEADER_KEY).add(urlToRedirect);
            return new ResponseEntity<>(headerParam, HttpStatus.FOUND);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @AttackVector(
            vulnerabilityExposed = {VulnerabilityType.OPEN_REDIRECT_3XX_STATUS_CODE},
            description = "OPEN_REDIRECT_QUERY_PARAM_DIRECTLY_ADD_TO_LOCATION_HEADER")
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_1,
            htmlTemplate = "LEVEL_1/Http3xxStatusCodeBasedInjection")
    public ResponseEntity<?> getVulnerablePayloadLevel1(
            @RequestParam(RETURN_TO) String urlToRedirect) {
        return this.getURLRedirectionResponseEntity(urlToRedirect, (url) -> true);
    }

    // Payloads:
    // 1. Protocol other than http can be used e.g. ftp://ftp.dlptest.com/ also
    // 2. "//facebook.com"
    @AttackVector(
            vulnerabilityExposed = {VulnerabilityType.OPEN_REDIRECT_3XX_STATUS_CODE},
            description =
                    "OPEN_REDIRECT_QUERY_PARAM_DIRECTLY_ADD_TO_LOCATION_HEADER_IF_NOT_HTTP_HTTPS_OR_DOMAIN_IS_SAME")
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_2,
            htmlTemplate = "LEVEL_1/Http3xxStatusCodeBasedInjection")
    public ResponseEntity<?> getVulnerablePayloadLevel2(
            RequestEntity<String> requestEntity, @RequestParam(RETURN_TO) String urlToRedirect)
            throws MalformedURLException {
        URL requestUrl = new URL(requestEntity.getUrl().toString());
        return this.getURLRedirectionResponseEntity(
                urlToRedirect,
                (url) ->
                        (!url.startsWith(FrameworkConstants.HTTP)
                                        && !url.startsWith(FrameworkConstants.HTTPS))
                                || requestUrl.getAuthority().equals(urlToRedirect));
    }

    // Payloads:
    // 1. /%09/localdomain.pw
    // 2. %00//google.com
    @AttackVector(
            vulnerabilityExposed = {VulnerabilityType.OPEN_REDIRECT_3XX_STATUS_CODE},
            description =
                    "OPEN_REDIRECT_QUERY_PARAM_DIRECTLY_ADD_TO_LOCATION_HEADER_IF_NOT_HTTP_HTTPS_//_OR_DOMAIN_IS_SAME")
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_3,
            htmlTemplate = "LEVEL_1/Http3xxStatusCodeBasedInjection")
    public ResponseEntity<?> getVulnerablePayloadLevel3(
            RequestEntity<String> requestEntity, @RequestParam(RETURN_TO) String urlToRedirect)
            throws MalformedURLException {
        URL requestUrl = new URL(requestEntity.getUrl().toString());
        return this.getURLRedirectionResponseEntity(
                urlToRedirect,
                (url) ->
                        (!url.startsWith(FrameworkConstants.HTTP)
                                        && !url.startsWith(FrameworkConstants.HTTPS)
                                        && !url.startsWith("//"))
                                || requestUrl.getAuthority().equals(url));
    }

    // As there can be too many hacks e.g. using %00 to %1F so blacklisting is not possible
    @AttackVector(
            vulnerabilityExposed = {VulnerabilityType.OPEN_REDIRECT_3XX_STATUS_CODE},
            description =
                    "OPEN_REDIRECT_QUERY_PARAM_DIRECTLY_ADD_TO_LOCATION_HEADER_IF_NOT_HTTP_HTTPS_//_NULL_BYTE_OR_DOMAIN_IS_SAME")
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_4,
            htmlTemplate = "LEVEL_1/Http3xxStatusCodeBasedInjection")
    public ResponseEntity<?> getVulnerablePayloadLevel4(
            RequestEntity<String> requestEntity, @RequestParam(RETURN_TO) String urlToRedirect)
            throws MalformedURLException {
        URL requestUrl = new URL(requestEntity.getUrl().toString());
        return this.getURLRedirectionResponseEntity(
                urlToRedirect,
                (url) ->
                        (!url.startsWith(FrameworkConstants.HTTP)
                                        && !url.startsWith(FrameworkConstants.HTTPS)
                                        && !url.startsWith("//")
                                        && !url.startsWith(NULL_BYTE_CHARACTER))
                                || requestUrl.getAuthority().equals(url));
    }

    // Payloads:
    //	1. /%09/localdomain.pw
    //  2. \/google.com
    //  3. \/\/localdomain.pw/
    @AttackVector(
            vulnerabilityExposed = {VulnerabilityType.OPEN_REDIRECT_3XX_STATUS_CODE},
            description =
                    "OPEN_REDIRECT_QUERY_PARAM_DIRECTLY_ADD_TO_LOCATION_HEADER_IF_NOT_HTTP_HTTPS_//_%_OR_DOMAIN_IS_SAME")
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_5,
            htmlTemplate = "LEVEL_1/Http3xxStatusCodeBasedInjection")
    public ResponseEntity<?> getVulnerablePayloadLevel5(
            RequestEntity<String> requestEntity, @RequestParam(RETURN_TO) String urlToRedirect)
            throws MalformedURLException {
        URL requestUrl = new URL(requestEntity.getUrl().toString());
        return this.getURLRedirectionResponseEntity(
                urlToRedirect,
                (url) ->
                        (!url.startsWith(FrameworkConstants.HTTP)
                                        && !url.startsWith(FrameworkConstants.HTTPS)
                                        && !url.startsWith("//")
                                        && !url.startsWith(NULL_BYTE_CHARACTER)
                                        && (url.length() > 0 && url.charAt(0) > 20))
                                || requestUrl.getAuthority().equals(url));
    }

    // case study explaning issue with this approach:
    // https://appsec-labs.com/portal/case-study-open-redirect/
    @AttackVector(
            vulnerabilityExposed = {VulnerabilityType.OPEN_REDIRECT_3XX_STATUS_CODE},
            description =
                    "OPEN_REDIRECT_QUERY_PARAM_DIRECTLY_ADDED_TO_LOCATION_HEADER_BY_ADDING_DOMAIN_AS_PREFIX")
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_6,
            htmlTemplate = "LEVEL_1/Http3xxStatusCodeBasedInjection")
    public ResponseEntity<?> getVulnerablePayloadLevel6(
            RequestEntity<String> requestEntity, @RequestParam(RETURN_TO) String urlToRedirect)
            throws MalformedURLException {
        MultiValueMap<String, String> headerParam = new HttpHeaders();
        URL requestUrl = new URL(requestEntity.getUrl().toString());
        headerParam.put(LOCATION_HEADER_KEY, new ArrayList<>());
        // ruleid: nonconstant-location-header
        headerParam
                .get(LOCATION_HEADER_KEY)
                .add(requestUrl.getProtocol() + "://" + requestUrl.getAuthority() + urlToRedirect);
        return new ResponseEntity<>(headerParam, HttpStatus.FOUND);
    }

    @AttackVector(
            vulnerabilityExposed = {VulnerabilityType.OPEN_REDIRECT_3XX_STATUS_CODE},
            description =
                    "OPEN_REDIRECT_QUERY_PARAM_DIRECTLY_ADDED_TO_LOCATION_HEADER_BY_ADDING_DOMAIN_AS_PREFIX")
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_7,
            htmlTemplate = "LEVEL_1/Http3xxStatusCodeBasedInjection")
    public ResponseEntity<?> getVulnerablePayloadLevel7(
            RequestEntity<String> requestEntity, @RequestParam(RETURN_TO) String urlToRedirect)
            throws MalformedURLException {
        MultiValueMap<String, String> headerParam = new HttpHeaders();
        URL requestUrl = new URL(requestEntity.getUrl().toString());
        headerParam.put(LOCATION_HEADER_KEY, new ArrayList<>());
        if (urlToRedirect.startsWith("/")) {
            urlToRedirect = urlToRedirect.substring(1);
        }
        // ruleid: nonconstant-location-header
        headerParam
                .get(LOCATION_HEADER_KEY)
                .add(
                        requestUrl.getProtocol()
                                + "://"
                                + requestUrl.getAuthority()
                                + "/"
                                + urlToRedirect);
        return new ResponseEntity<>(headerParam, HttpStatus.FOUND);
    }

    // using whitelisting approach
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_8,
            htmlTemplate = "LEVEL_1/Http3xxStatusCodeBasedInjection")
    public ResponseEntity<?> getVulnerablePayloadLevel8(
            RequestEntity<String> requestEntity, @RequestParam(RETURN_TO) String urlToRedirect) {
        return this.getURLRedirectionResponseEntity(
                urlToRedirect, (url) -> WHITELISTED_URLS.contains(url));
    }
}
