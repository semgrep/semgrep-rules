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

        String payload = String.format(vulnerablePayloadWithPlaceHolder, imageLocation);

        // ruleid: tainted-html-string
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
                String.format(
                        vulnerablePayloadWithPlaceHolder,
                        StringEscapeUtils.escapeHtml4(imageLocation));

        // ruleid: tainted-html-string
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
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            StringEscapeUtils.escapeHtml4(imageLocation)));
        }

        // ruleid: tainted-html-string
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
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            StringEscapeUtils.escapeHtml4(imageLocation)));
        }

        // ruleid: tainted-html-string
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
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            StringEscapeUtils.escapeHtml4(imageLocation));

            // ruleid: tainted-html-string
            return ResponseEntity.ok(payload).headers(responseHeaders).build();
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
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            HtmlUtils.htmlEscapeHex(imageLocation));

            // ruleid: tainted-html-string
            return ResponseEntity.ok(payload);

        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
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
    public ResponseEntity<String> getVulnerablePayloadLevelSecure3(
            @RequestParam(PARAMETER_NAME) String imageLocation) {
        String vulnerablePayloadWithPlaceHolder = "<img src=\"%s\" width=\"400\" height=\"300\"/>";

        if ((imageLocation.startsWith(IMAGE_RESOURCE_PATH)
                        && imageLocation.endsWith(FILE_EXTENSION))
                || allowedValues.contains(imageLocation)) {

            String payload =
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            HtmlUtils.htmlEscapeHex(imageLocation));

            return ResponseEntity.ok()
            .contentType(MediaType.TEXT_PLAIN)
            // ruleid: tainted-html-string
            .body(payload);;

        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
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
    public ResponseEntity<String> getVulnerablePayloadLevelSecure2(
            @RequestParam(PARAMETER_NAME) String imageLocation) {
        String vulnerablePayloadWithPlaceHolder = "<img src=\"%s\" width=\"400\" height=\"300\"/>";

        if ((imageLocation.startsWith(IMAGE_RESOURCE_PATH)
                        && imageLocation.endsWith(FILE_EXTENSION))
                || allowedValues.contains(imageLocation)) {

            vulnerablePayloadWithPlaceHolder += imageLocation;

            // ruleid: tainted-html-string
            return new ResponseEntity<Success>(vulnerablePayloadWithPlaceHolder, HttpStatus.OK);

        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
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
    public ResponseEntity<String> getVulnerablePayloadLevelSecure3(
            @RequestParam(PARAMETER_NAME) String imageLocation) {
        String vulnerablePayloadWithPlaceHolder = "not html";

        if ((imageLocation.startsWith(IMAGE_RESOURCE_PATH)
                        && imageLocation.endsWith(FILE_EXTENSION))
                || allowedValues.contains(imageLocation)) {

            vulnerablePayloadWithPlaceHolder += imageLocation;

            // ok: tainted-html-string
            return new ResponseEntity<Success>(vulnerablePayloadWithPlaceHolder, HttpStatus.OK);

        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
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
    public ResponseEntity<String> getVulnerablePayloadLevelSecured(
            @RequestParam(PARAMETER_NAME) String imageLocation) {
        String vulnerablePayloadWithPlaceHolder = "<img src=\"%s\" width=\"400\" height=\"300\"/>";

        if ((imageLocation.startsWith(IMAGE_RESOURCE_PATH)
                        && imageLocation.endsWith(FILE_EXTENSION))
                || allowedValues.contains(imageLocation)) {

            String payload =
                    String.format(
                            vulnerablePayloadWithPlaceHolder,
                            HtmlUtils.htmlEscapeHex(imageLocation));


            String cleaned = Encode.forHtml(payload);
            // ok: tainted-html-string
            return new ResponseEntity<>(cleaned, HttpStatus.OK);

        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}

/**
 * Assignment for picking a good security question.
 *
 * @author Tobias Melzer
 * @since 11.12.18
 */
/*
 * This file is part of WebGoat, an Open Web Application Security Project utility. For details, please see http://www.owasp.org/
 *
 * Copyright (c) 2002 - 2019 Bruce Mayhew
 *
 * This program is free software; you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
 * even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program; if
 * not, write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 *
 * Getting Source ==============
 *
 * Source for this application is maintained at https://github.com/WebGoat/WebGoat, a repository for free software projects.
 */
@RestController
public class SecurityQuestionAssignment extends AssignmentEndpoint {

  @Autowired private TriedQuestions triedQuestions;

  private static Map<String, String> questions;

  static {
    questions = new HashMap<>();
    questions.put(
        "What is your favorite animal?",
        "The answer can easily be guessed and figured out through social media.");
    questions.put("In what year was your mother born?", "Can  be easily guessed.");
    questions.put(
        "What was the time you were born?",
        "This may first seem like a good question, but you most likely dont know the exact time, so"
            + " it might be hard to remember.");
    questions.put(
        "What is the name of the person you first kissed?",
        "Can be figured out through social media, or even guessed by trying the most common"
            + " names.");
    questions.put(
        "What was the house number and street name you lived in as a child?",
        "Answer can be figured out through social media, or worse it might be your current"
            + " address.");
    questions.put(
        "In what town or city was your first full time job?",
        "In times of LinkedIn and Facebook, the answer can be figured out quite easily.");
    questions.put("In what city were you born?", "Easy to figure out through social media.");
    questions.put(
        "What was the last name of your favorite teacher in grade three?",
        "Most people would probably not know the answer to that.");
    questions.put(
        "What is the name of a college/job you applied to but didn't attend?",
        "It might not be easy to remember and an hacker could just try some company's/colleges in"
            + " your area.");
    questions.put(
        "What are the last 5 digits of your drivers license?",
        "Is subject to change, and the last digit of your driver license might follow a specific"
            + " pattern. (For example your birthday).");
    questions.put("What was your childhood nickname?", "Not all people had a nickname.");
    questions.put(
        "Who was your childhood hero?",
        "Most Heroes we had as a child where quite obvious ones, like Superman for example.");
    questions.put(
        "On which wrist do you wear your watch?",
        "There are only to possible real answers, so really easy to guess.");
    questions.put("What is your favorite color?", "Can easily be guessed.");
  }

  @PostMapping("/PasswordReset/SecurityQuestions")
  @ResponseBody
  public AttackResult completed(@RequestParam String question) {
    var answer = of(questions.get(question));
    if (answer.isPresent()) {
      triedQuestions.incr(question);
      if (triedQuestions.isComplete()) {
        //ok: tainted-html-string
        return success(this).output("<b>" + answer + "</b>").build();
      }
    }
    return informationMessage(this)
        .feedback("password-questions-one-successful")
        .output(answer.orElse("Unknown question, please try again..."))
        .build();
  }

  @PostMapping("SecurePasswords/assignment")
  @ResponseBody
  public AttackResult completed2(@RequestParam String password) {
    Zxcvbn zxcvbn = new Zxcvbn();
    StringBuilder output = new StringBuilder();
    DecimalFormat df = new DecimalFormat("0", DecimalFormatSymbols.getInstance(Locale.ENGLISH));
    df.setMaximumFractionDigits(340);
    Strength strength = zxcvbn.measure(password);

    output.append("<b>Your Password: *******</b></br>");
    output.append("<b>Length: </b>" + password.length() + "</br>");
    output.append(
        "<b>Estimated guesses needed to crack your password: </b>"
            + df.format(strength.getGuesses())
            + "</br>");

    if (strength.getScore() >= 4)
        // ok: tainted-html-string
        return success(this).feedback("securepassword-success").output(output.toString()).build();
    // ok: tainted-html-string
    else return failed(this).feedback("securepassword-failed").output(output.toString()).build();
  }
}

@RestController
public class SecurePasswordsAssignment extends AssignmentEndpoint {

  @PostMapping("SecurePasswords/assignment")
  @ResponseBody
  public AttackResult completed(@RequestParam String password) {
    Zxcvbn zxcvbn = new Zxcvbn();
    StringBuilder output = new StringBuilder();
    DecimalFormat df = new DecimalFormat("0", DecimalFormatSymbols.getInstance(Locale.ENGLISH));
    df.setMaximumFractionDigits(340);
    Strength strength = zxcvbn.measure(password);

    output.append("<b>Your Password: *******</b></br>");
    output.append("<b>Length: </b>" + password.length() + "</br>");
    output.append(
        "<b>Estimated guesses needed to crack your password: </b>"
            + df.format(strength.getGuesses())
            + "</br>");
    output.append(
        "<div style=\"float: left;padding-right: 10px;\"><b>Score: </b>"
            + strength.getScore()
            + "/4 </div>");
    if (strength.getScore() <= 1) {
      output.append(
          "<div style=\"background-color:red;width: 200px;border-radius: 12px;float:"
              + " left;\">&nbsp;</div></br>");
    } else if (strength.getScore() <= 3) {
      output.append(
          "<div style=\"background-color:orange;width: 200px;border-radius: 12px;float:"
              + " left;\">&nbsp;</div></br>");
    } else {
      output.append(
          "<div style=\"background-color:green;width: 200px;border-radius: 12px;float:"
              + " left;\">&nbsp;</div></br>");
    }
    output.append(
        "<b>Estimated cracking time: </b>"
            + calculateTime(
                (long) strength.getCrackTimeSeconds().getOnlineNoThrottling10perSecond())
            + "</br>");
    if (strength.getFeedback().getWarning().length() != 0)
      output.append("<b>Warning: </b>" + strength.getFeedback().getWarning() + "</br>");
    // possible feedback: https://github.com/dropbox/zxcvbn/blob/master/src/feedback.coffee
    // maybe ask user to try also weak passwords to see and understand feedback?
    if (strength.getFeedback().getSuggestions().size() != 0) {
      output.append("<b>Suggestions:</b></br><ul>");
      for (String sug : strength.getFeedback().getSuggestions())
        output.append("<li>" + sug + "</li>");
      output.append("</ul></br>");
    }
    output.append("<b>Score: </b>" + strength.getScore() + "/4 </br>");

    if (strength.getScore() >= 4)
      // ok: tainted-html-string
      return success(this).feedback("securepassword-success").output(output.toString()).build();
    // ok: tainted-html-string
    else return failed(this).feedback("securepassword-failed").output(output.toString()).build();
  }

  public static String calculateTime(long seconds) {
    int s = 1;
    int min = (60 * s);
    int hr = (60 * min);
    int d = (24 * hr);
    int yr = (365 * d);

    long years = seconds / (d) / 365;
    long days = (seconds % yr) / (d);
    long hours = (seconds % d) / (hr);
    long minutes = (seconds % hr) / (min);
    long sec = (seconds % min * s);

    return (years
        + " years "
        + days
        + " days "
        + hours
        + " hours "
        + minutes
        + " minutes "
        + sec
        + " seconds");
  }
}
