package org.sasanlabs.service.vulnerability.commandInjection;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.function.Supplier;
import java.util.regex.Pattern;
import org.apache.commons.lang3.StringUtils;
import org.sasanlabs.internal.utility.LevelConstants;
import org.sasanlabs.internal.utility.Variant;
import org.sasanlabs.internal.utility.annotations.AttackVector;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRequestMapping;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRestController;
import org.sasanlabs.service.exception.ServiceApplicationException;
import org.sasanlabs.service.vulnerability.bean.GenericVulnerabilityResponseBean;
import org.sasanlabs.vulnerability.types.VulnerabilityType;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * This class contains vulnerabilities related to Command Injection. <a
 * href="https://owasp.org/www-community/attacks/Command_Injection">For More information</a>
 *
 * @author KSASAN preetkaran20@gmail.com
 */
@VulnerableAppRestController(
        descriptionLabel = "COMMAND_INJECTION_VULNERABILITY",
        value = "CommandInjection")
public class CommandInjection {

    private static final String IP_ADDRESS = "ipaddress";
    private static final Pattern SEMICOLON_SPACE_LOGICAL_AND_PATTERN = Pattern.compile("[;& ]");
    private static final Pattern IP_ADDRESS_PATTERN =
            Pattern.compile("\\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\\.|$)){4}\\b");

    StringBuilder getResponseFromPingCommand(String ipAddress, boolean isValid) throws IOException {
        boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
        StringBuilder stringBuilder = new StringBuilder();
        if (isValid) {
            Process process;
            if (!isWindows) {
                // proruleid: tainted-system-command
                process =
                        new ProcessBuilder(new String[] {"sh", "-c", "ping -c 2 " + ipAddress})
                                .redirectErrorStream(true)
                                .start();
            } else {
               	// proruleid: tainted-system-command
                process =
                        new ProcessBuilder(new String[] {"cmd", "/c", "ping -n 2 " + ipAddress})
                                .redirectErrorStream(true)
                                .start();
            }
            try (BufferedReader bufferedReader =
                    new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                bufferedReader.lines().forEach(val -> stringBuilder.append(val).append("\n"));
            }
        }
        return stringBuilder;
    }

    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.COMMAND_INJECTION,
            description = "COMMAND_INJECTION_URL_PARAM_DIRECTLY_EXECUTED")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_1, htmlTemplate = "LEVEL_1/CI_Level1")
    public ResponseEntity<GenericVulnerabilityResponseBean<String>> getVulnerablePayloadLevel1(
            @RequestParam(IP_ADDRESS) String ipAddress) throws IOException {
        Supplier<Boolean> validator = () -> StringUtils.isNotBlank(ipAddress);
        boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
        StringBuilder stringBuilder = new StringBuilder();
        if (isValid) {
            Process process;
            if (!isWindows) {
                // ruleid: tainted-system-command
                process =
                        new ProcessBuilder(new String[] {"sh", "-c", "ping -c 2 " + ipAddress})
                                .redirectErrorStream(true)
                                .start();
            } else {
                // ruleid: tainted-system-command
                process =
                        new ProcessBuilder(new String[] {"cmd", "/c", "ping -n 2 " + ipAddress})
                                .redirectErrorStream(true)
                                .start();
            }
            try (BufferedReader bufferedReader =
                    new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                bufferedReader.lines().forEach(val -> stringBuilder.append(val).append("\n"));
            }
        }
        return new ResponseEntity<GenericVulnerabilityResponseBean<String>>(
                new GenericVulnerabilityResponseBean<String>(
                        stringBuilder.toString(),
                        true),
                HttpStatus.OK);
    }

    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.COMMAND_INJECTION,
            description =
                    "COMMAND_INJECTION_URL_PARAM_DIRECTLY_EXECUTED_IF_SEMICOLON_SPACE_LOGICAL_AND_NOT_PRESENT")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_2, htmlTemplate = "LEVEL_1/CI_Level1")
    public ResponseEntity<GenericVulnerabilityResponseBean<String>> getVulnerablePayloadLevel2(
            @RequestParam(IP_ADDRESS) String ipAddress, RequestEntity<String> requestEntity)
            throws ServiceApplicationException, IOException {

        Supplier<Boolean> validator =
                () ->
                        StringUtils.isNotBlank(ipAddress)
                                && !SEMICOLON_SPACE_LOGICAL_AND_PATTERN
                                        .matcher(requestEntity.getUrl().toString())
                                        .find();
        return new ResponseEntity<GenericVulnerabilityResponseBean<String>>(
                new GenericVulnerabilityResponseBean<String>(
                        // todoruleid: tainted-system-command
                        // Indirection, needs interproc taint
                        this.getResponseFromPingCommand(ipAddress, validator.get()).toString(),
                        true),
                HttpStatus.OK);
    }

    // Case Insensitive
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.COMMAND_INJECTION,
            description =
                    "COMMAND_INJECTION_URL_PARAM_DIRECTLY_EXECUTED_IF_SEMICOLON_SPACE_LOGICAL_AND_%26_%3B_NOT_PRESENT")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_3, htmlTemplate = "LEVEL_1/CI_Level1")
    public ResponseEntity<GenericVulnerabilityResponseBean<String>> getVulnerablePayloadLevel3(
            @RequestParam(IP_ADDRESS) String ipAddress, RequestEntity<String> requestEntity)
            throws ServiceApplicationException, IOException {

        Supplier<Boolean> validator =
                () ->
                        StringUtils.isNotBlank(ipAddress)
                                && !SEMICOLON_SPACE_LOGICAL_AND_PATTERN
                                        .matcher(requestEntity.getUrl().toString())
                                        .find()
                                && !requestEntity.getUrl().toString().contains("%26")
                                && !requestEntity.getUrl().toString().contains("%3B");
        return new ResponseEntity<GenericVulnerabilityResponseBean<String>>(
                new GenericVulnerabilityResponseBean<String>(
                        this.getResponseFromPingCommand(ipAddress, validator.get()).toString(),
                        true),
                HttpStatus.OK);
    }

    // e.g Attack
    // http://localhost:9090/vulnerable/CommandInjectionVulnerability/LEVEL_3?ipaddress=192.168.0.1%20%7c%20cat%20/etc/passwd
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.COMMAND_INJECTION,
            description =
                    "COMMAND_INJECTION_URL_PARAM_DIRECTLY_EXECUTED_IF_SEMICOLON_SPACE_LOGICAL_AND_%26_%3B_CASE_INSENSITIVE_NOT_PRESENT")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_4, htmlTemplate = "LEVEL_1/CI_Level1")
    public ResponseEntity<GenericVulnerabilityResponseBean<String>> getVulnerablePayloadLevel4(
            @RequestParam(IP_ADDRESS) String ipAddress, RequestEntity<String> requestEntity)
            throws ServiceApplicationException, IOException {

        Supplier<Boolean> validator =
                () ->
                        StringUtils.isNotBlank(ipAddress)
                                && !SEMICOLON_SPACE_LOGICAL_AND_PATTERN
                                        .matcher(requestEntity.getUrl().toString())
                                        .find()
                                && !requestEntity.getUrl().toString().toUpperCase().contains("%26")
                                && !requestEntity.getUrl().toString().toUpperCase().contains("%3B");
        return new ResponseEntity<GenericVulnerabilityResponseBean<String>>(
                new GenericVulnerabilityResponseBean<String>(
                        this.getResponseFromPingCommand(ipAddress, validator.get()).toString(),
                        true),
                HttpStatus.OK);
    }
    // Payload: 127.0.0.1%0Als
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.COMMAND_INJECTION,
            description =
                    "COMMAND_INJECTION_URL_PARAM_DIRECTLY_EXECUTED_IF_SEMICOLON_SPACE_LOGICAL_AND_%26_%3B_%7C_CASE_INSENSITIVE_NOT_PRESENT")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_5, htmlTemplate = "LEVEL_1/CI_Level1")
    public ResponseEntity<GenericVulnerabilityResponseBean<String>> getVulnerablePayloadLevel5(
            @RequestParam(IP_ADDRESS) String ipAddress, RequestEntity<String> requestEntity)
            throws IOException {
        Supplier<Boolean> validator =
                () ->
                        StringUtils.isNotBlank(ipAddress)
                                && !SEMICOLON_SPACE_LOGICAL_AND_PATTERN
                                        .matcher(requestEntity.getUrl().toString())
                                        .find()
                                && !requestEntity.getUrl().toString().toUpperCase().contains("%26")
                                && !requestEntity.getUrl().toString().toUpperCase().contains("%3B")
                                        & !requestEntity
                                                .getUrl()
                                                .toString()
                                                .toUpperCase()
                                                .contains("%7C");
        return new ResponseEntity<GenericVulnerabilityResponseBean<String>>(
                new GenericVulnerabilityResponseBean<String>(
                        this.getResponseFromPingCommand(ipAddress, validator.get()).toString(),
                        true),
                HttpStatus.OK);
    }

    @VulnerableAppRequestMapping(
            value = LevelConstants.LEVEL_6,
            htmlTemplate = "LEVEL_1/CI_Level1",
            variant = Variant.SECURE)
    public ResponseEntity<GenericVulnerabilityResponseBean<String>> getVulnerablePayloadLevel6(
            @RequestParam(IP_ADDRESS) String ipAddress) throws IOException {
        Supplier<Boolean> validator =
                () ->
                        StringUtils.isNotBlank(ipAddress)
                                && (IP_ADDRESS_PATTERN.matcher(ipAddress).matches()
                                        || ipAddress.contentEquals("localhost"));

        return new ResponseEntity<GenericVulnerabilityResponseBean<String>>(
                new GenericVulnerabilityResponseBean<String>(
                        this.getResponseFromPingCommand(ipAddress, validator.get()).toString(),
                        true),
                HttpStatus.OK);
    }

    public static void test1(@RequestParam(IP_ADDRESS) String ipAddress) {
        String args = "ping -c 2 " + ipAddress + "test";
        Process process;
        process = new ProcessBuilder(new String[] {"sh", "-c", args});
        // ruleid: tainted-system-command
        process.start();
    }

    public static void test2(@RequestParam String input) {
        String latlonCoords = input;
        Runtime rt = Runtime.getRuntime();
        // ok: tainted-system-command
        Process exec = rt.exec(new String[] {
                "c:\\path\to\latlon2utm.exe",
                latlonCoords }); // safe bc args are seperated
    }

    public static void test3(@RequestParam String input) {
        StringBuilder stringBuilder = new StringBuilder(100);
        stringBuilder.append(input);
        stringBuilder.append("test2");
        Runtime rt = Runtime.getRuntime();
        // ruleid: tainted-system-command
        Process exec = rt.exec(stringBuilder);
    }

    public static void test4(@RequestParam String input) {
        String test1 = "test";
        String comb = test1.concat(input);
        Runtime rt = Runtime.getRuntime();
        // ruleid: tainted-system-command
        Process exec = rt.exec(comb);
    }

    public static void test5(@RequestParam String input) {
        String test1 = "test";
        String comb = String.format("%s%s", test1, input);
        Runtime rt = Runtime.getRuntime();
        // ruleid: tainted-system-command
        Process exec = rt.exec(comb);
    }

    public static String run(@RequestParam(defaultValue = "I love Linux!") String input) {
        ProcessBuilder processBuilder = new ProcessBuilder();
        String cmd = "/usr/games/cowsay '" + input + "'";
        System.out.println(cmd);
        // ruleid: tainted-system-command
        processBuilder.command("bash", "-c", cmd);
    
        StringBuilder output = new StringBuilder();
    
        try {
          Process process = processBuilder.start();
          BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
    
          String line;
          while ((line = reader.readLine()) != null) {
            output.append(line + "\n");
          }
        } catch (Exception e) {
          e.printStackTrace();
        }
        return output.toString();
      }
}
