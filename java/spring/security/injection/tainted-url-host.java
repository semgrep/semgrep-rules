package org.sasanlabs.service.vulnerability.ssrf;

import com.nimbusds.jose.util.StandardCharset;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.sasanlabs.internal.utility.LevelConstants;
import org.sasanlabs.internal.utility.annotations.AttackVector;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRequestMapping;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRestController;
import org.sasanlabs.service.vulnerability.bean.GenericVulnerabilityResponseBean;
import org.sasanlabs.vulnerability.types.VulnerabilityType;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.RequestParam;

@VulnerableAppRestController(descriptionLabel = "SSRF_VULNERABILITY", value = "SSRFVulnerability")
public class SSRFVulnerability {

    private static final String IMAGE_URL = "imageurl";
    private static final transient Logger LOGGER = LogManager.getLogger(SSRFVulnerability.class);

    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.SIMPLE_SSRF,
            description = "IMAGE_URL_PASSED_TO_REQUEST")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_1, htmlTemplate = "LEVEL_1/SSRF")
    public ResponseEntity<GenericVulnerabilityResponseBean<byte[]>> getVulnerablePayloadLevel1(
            @RequestParam(IMAGE_URL) String urlImage) {
        try {
            // ruleid: tainted-url-host
            URL u = new URL(urlImage);
            URLConnection urlConnection = u.openConnection();
            byte[] bytes;
            try (InputStream in = urlConnection.getInputStream()) {
                bytes = StreamUtils.copyToByteArray(urlConnection.getInputStream());
            }
            return new ResponseEntity<>(
                    new GenericVulnerabilityResponseBean<>(bytes, true), HttpStatus.OK);
        } catch (Exception e) {
            LOGGER.error(
                    "Following exception occurred while opening the connection to {}", urlImage, e);
        }
        return new ResponseEntity<>(
                new GenericVulnerabilityResponseBean<>(
                        ("Failed to fetch image from URL " + urlImage)
                                .getBytes(StandardCharset.UTF_8),
                        false),
                HttpStatus.BAD_REQUEST);
    }
}


@RestController
@RequestMapping("/user03")
public class User03Controller {

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/get")
    public UserDTO get(@RequestParam("id") Integer id) {
        // ok: tainted-url-host
        String url = String.format("http://%s/user/get?id=%d", "demo-provider", id);
        return restTemplate.getForObject(url, UserDTO.class);
    }

    @PostMapping("/add")
    public Integer add(UserAddDTO addDTO) {
        // 请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // 请求体
        String body = JSON.toJSONString(addDTO);
        // 创建 HttpEntity 对象
        HttpEntity<String> entity = new HttpEntity<>(body, headers);
        // 执行请求
        // ok: tainted-url-host
        String url = String.format("http://%s/user/add", "demo-provider");
        return restTemplate.postForObject(url, entity, Integer.class);
    }

}

