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


@RestController
@RequestMapping("/proxy")
public class ProxyController {

    @Autowired
    private RestTemplate restTemplate;

    // The first positional arg of every RestTemplate request method is the URL,
    // so a tainted @RequestParam reaching it is server-side request forgery.
    @GetMapping("/fetch")
    public ResponseEntity<byte[]> fetch(@RequestParam("url") String url) {
        // ruleid: tainted-url-host
        return restTemplate.getForEntity(url, byte[].class);
    }

    @GetMapping("/post")
    public String proxyPost(@RequestParam("target") String target, @RequestBody String body) {
        // ruleid: tainted-url-host
        return restTemplate.postForObject(target, body, String.class);
    }

    @PutMapping("/replace")
    public void proxyPut(@RequestParam("target") String target, @RequestBody String body) {
        // ruleid: tainted-url-host
        restTemplate.put(target, body);
    }

    @DeleteMapping("/wipe")
    public void proxyDelete(@RequestParam("target") String target) {
        // ruleid: tainted-url-host
        restTemplate.delete(target);
    }

    @GetMapping("/exchange")
    public ResponseEntity<String> proxyExchange(@RequestParam("target") String target) {
        // ruleid: tainted-url-host
        return restTemplate.exchange(target, HttpMethod.GET, null, String.class);
    }
}


@RestController
@RequestMapping("/uri")
public class UriController {

    // java.net.URI / java.net.URL constructed directly from request data.
    @GetMapping("/parse")
    public String parseUri(@RequestParam("url") String url) {
        // ruleid: tainted-url-host
        URI parsed = URI.create(url);
        return parsed.toString();
    }

    @GetMapping("/parse-fq")
    public String parseFqUri(@RequestParam("url") String url) {
        // ruleid: tainted-url-host
        java.net.URI parsed = java.net.URI.create(url);
        return parsed.toString();
    }
}


@RestController
@RequestMapping("/apache")
public class ApacheHttpClientController {

    // Apache HttpClient request constructors take the URL as the only argument.
    @GetMapping("/get")
    public void apacheGet(@RequestParam("url") String url) throws Exception {
        // ruleid: tainted-url-host
        HttpGet req = new HttpGet(url);
        HttpClient client = HttpClients.createDefault();
        client.execute(req);
    }

    @GetMapping("/post")
    public void apachePost(@RequestParam("url") String url) throws Exception {
        // ruleid: tainted-url-host
        HttpPost req = new HttpPost(url);
        HttpClient client = HttpClients.createDefault();
        client.execute(req);
    }
}


@RestController
@RequestMapping("/webclient")
public class WebClientController {

    @Autowired
    private WebClient webClient;

    @GetMapping("/fetch")
    public Mono<String> fetch(@RequestParam("url") String url) {
        // ruleid: tainted-url-host
        return webClient.get().uri(url).retrieve().bodyToMono(String.class);
    }
}

