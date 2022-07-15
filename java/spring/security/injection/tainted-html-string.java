package org.sasanlabs.service.vulnerability.xss.reflected;

import java.util.HashSet;
import java.util.Set;
import org.apache.commons.text.StringEscapeUtils;
import org.sasanlabs.internal.utility.LevelConstants;
import org.sasanlabs.internal.utility.Variant;
import org.sasanlabs.internal.utility.annotations.AttackVector;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRequestMapping;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRestController;
import org.sasanlabs.vulnerability.types.VulnerabilityType;
import org.sasanlabs.vulnerability.utils.Constants;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

/**
 * This class contains XSS vulnerabilities which are present in Image Tag attribute.
 *
 * @author KSASAN preetkaran20@gmail.com
 * @author jpralle janpralle@gmail.com
 * @author t0bel1x t0bel1x.git@gmail.com
 * @author pdelmonego philipp.delmonego@live.de
 */
@VulnerableAppRestController(descriptionLabel = "XSS_VULNERABILITY", value = "XSSInImgTagAttribute")
public class XSSInImgTagAttribute {

    private static final String OWASP_IMAGE = "images/owasp.png";
    private static final String ZAP_IMAGE = "images/ZAP.png";
    private static final String PARAMETER_NAME = "src";
    public static final String IMAGE_RESOURCE_PATH = "/VulnerableApp/images/";
    public static final String FILE_EXTENSION = ".png";

    private final Set<String> allowedValues = new HashSet<>();

    public XSSInImgTagAttribute() {
        allowedValues.add(OWASP_IMAGE);
        allowedValues.add(ZAP_IMAGE);
    }

    // Just adding User defined input(Untrusted Data) into Src tag is not secure.
    // Can be broken by various ways
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description = "XSS_DIRECT_INPUT_SRC_ATTRIBUTE_IMG_TAG")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_1, htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevel1(
            @RequestParam(PARAMETER_NAME) String imageLocation) {

        String vulnerablePayloadWithPlaceHolder = "<img src=%s width=\"400\" height=\"300\"/>";

        return new ResponseEntity<>(
                // ruleid: tainted-html-string
                String.format(vulnerablePayloadWithPlaceHolder, imageLocation), HttpStatus.OK);
    }

    // Adding Untrusted Data into Src tag between quotes is beneficial but not
    // without escaping the input
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description = "XSS_QUOTES_ON_INPUT_SRC_ATTRIBUTE_IMG_TAG")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_2, htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevel2(
            @RequestParam(PARAMETER_NAME) String imageLocation) {

        String vulnerablePayloadWithPlaceHolder = "<img src=\"%s\" width=\"400\" height=\"300\"/>";

        // ruleid: tainted-html-string
        String payload = String.format(vulnerablePayloadWithPlaceHolder, imageLocation);

        return new ResponseEntity<>(payload, HttpStatus.OK);
    }

    // Good way for HTML escapes so hacker cannot close the tags but can use event
    // handlers like onerror etc. eg:- ''onerror='alert(1);'
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description = "XSS_HTML_ESCAPE_ON_DIRECT_INPUT_SRC_ATTRIBUTE_IMG_TAG")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_3, htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevel3(
            @RequestParam(PARAMETER_NAME) String imageLocation) {

        String vulnerablePayloadWithPlaceHolder = "<img src=%s width=\"400\" height=\"300\"/>";

        String payload =
                // ruleid: tainted-html-string
                String.format(
                        vulnerablePayloadWithPlaceHolder,
                        StringEscapeUtils.escapeHtml4(imageLocation));

        return new ResponseEntity<>(payload, HttpStatus.OK);
    }

    // Good way for HTML escapes so hacker cannot close the tags and also cannot pass brackets but
    // can use event
    // handlers like onerror etc. eg:- onerror=alert`1` (backtick operator)
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description =
                    "XSS_HTML_ESCAPE_ON_DIRECT_INPUT_AND_REMOVAL_OF_VALUES_WITH_PARENTHESIS_SRC_ATTRIBUTE_IMG_TAG")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_4, htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevel4(
            @RequestParam(PARAMETER_NAME) String imageLocation) {

        String vulnerablePayloadWithPlaceHolder = "<img src=%s width=\"400\" height=\"300\"/>";
        StringBuilder payload = new StringBuilder();

        if (!imageLocation.contains("(") || !imageLocation.contains(")")) {
            payload.append(
                    // ruleid: tainted-html-string
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            StringEscapeUtils.escapeHtml4(imageLocation)));
        }

        return new ResponseEntity<>(payload.toString(), HttpStatus.OK);
    }

    // Assume here that there is a validator vulnerable to Null Byte which validates the file name
    // only till null byte
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description =
                    "XSS_HTML_ESCAPE_PLUS_FILTERING_ON_INPUT_SRC_ATTRIBUTE_IMG_TAG_BUT_NULL_BYTE_VULNERABLE")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_5, htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevel5(
            @RequestParam(PARAMETER_NAME) String imageLocation) {

        String vulnerablePayloadWithPlaceHolder = "<img src=%s width=\"400\" height=\"300\"/>";
        StringBuilder payload = new StringBuilder();

        String validatedFileName = imageLocation;

        // Behavior of Null Byte Vulnerable Validator for filename
        if (imageLocation.contains(Constants.NULL_BYTE_CHARACTER)) {
            validatedFileName =
                    imageLocation.substring(
                            0, imageLocation.indexOf(Constants.NULL_BYTE_CHARACTER));
        }

        if (allowedValues.contains(validatedFileName)) {
            payload.append(
                    // ruleid: tainted-html-string
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            StringEscapeUtils.escapeHtml4(imageLocation)));
        }

        return new ResponseEntity<>(payload.toString(), HttpStatus.OK);
    }

    // Good way and can protect against attacks but it is better to have check on
    // the input values provided if possible.
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description = "XSS_QUOTES_AND_WITH_HTML_ESCAPE_ON_INPUT_SRC_ATTRIBUTE_IMG_TAG")
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_6,
            variant = Variant.SECURE,
            htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevel6(
            @RequestParam(PARAMETER_NAME) String imageLocation) {

        String vulnerablePayloadWithPlaceHolder = "<img src=\"%s\" width=\"400\" height=\"300\"/>";

        if (allowedValues.contains(imageLocation)) {
            String payload =
                    // ruleid: tainted-html-string
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            StringEscapeUtils.escapeHtml4(imageLocation));

            return new ResponseEntity<>(payload, HttpStatus.OK);
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    // Escape all special characters to their corresponding HTML hex format
    // and validate input.
    // Would be even better if Content Security Policy (CSP) is set.
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description =
                    "XSS_QUOTES_AND_WITH_HTML_ESCAPE_PLUS_FILTERING_ON_INPUT_SRC_ATTRIBUTE_IMG_TAG")
    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_7,
            variant = Variant.SECURE,
            htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevelSecure(
            @RequestParam(PARAMETER_NAME) String imageLocation) {
        String vulnerablePayloadWithPlaceHolder = "<img src=\"%s\" width=\"400\" height=\"300\"/>";

        if ((imageLocation.startsWith(IMAGE_RESOURCE_PATH)
                        && imageLocation.endsWith(FILE_EXTENSION))
                || allowedValues.contains(imageLocation)) {

            String payload =
                    // ruleid: tainted-html-string
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            HtmlUtils.htmlEscapeHex(imageLocation));

            return new ResponseEntity<>(payload, HttpStatus.OK);

        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
        