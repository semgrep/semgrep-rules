private class Car {
    private Fake variable;

    @JsonTypeInfo(use = Id.CLASS)
    private Object color;
    private String type;

    public Car() {
    }

    public Car(Object color, String type) {
        this.color = color;
        this.type = type;
    }

    public String getColor() {
        return (String) this.color;
    }

    public void setColor(Object color) {
        this.color = color;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public static void main(String[] args) throws JsonGenerationException, JsonMappingException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.enableDefaultTyping();

        try {
            // ruleid: jackson-unsafe-deserialization
            Car car = objectMapper.readValue(Paths.get("target/payload.json").toFile(), Car.class);
            System.out.println((car.getColor()));
        } catch (Exception e) {
            System.out.println("Exception raised:" + e.getMessage());
        }

    }

    public static void anotherMain(String[] args) throws JsonGenerationException, JsonMappingException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        // Disable default typing globally
        // objectMapper.enableDefaultTyping();

        try {
            // ruleid: jackson-unsafe-deserialization
            Car car = objectMapper.readValue(Paths.get("target/payload.json").toFile(), Car.class);
            System.out.println((car.getColor()));
        } catch (Exception e) {
            System.out.println("Exception raised:" + e.getMessage());
        }

    }

    public static void anotherMain2(String[] args) throws JsonGenerationException, JsonMappingException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            // ok: jackson-unsafe-deserialization
            Car car = objectMapper.readValue(Paths.get("target/payload.json").toFile(), Another.class);
            System.out.println((car.getColor()));
        } catch (Exception e) {
            System.out.println("Exception raised:" + e.getMessage());
        }

    }
}

// Additional class to test rule when ObjectMapper is created in a different
// method
@RestController
public class MyController {
    private Test variable;
    private ObjectMapper objectMapper;
    private Test2 variable2;

    @PostConstruct
    public void initialize() {
        this.variable = 123;
        objectMapper = new ObjectMapper();
        objectMapper.enableDefaultTyping();
        this.variable2 = 456;
    }

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public void redirectToUserInfo(HttpServletResponse response) throws IOException {
        response.sendRedirect("/somewhere");
    }

    @RequestMapping(path = "/vulnerable", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public GenericUser vulnerable(@CookieValue(name = "token", required = false) String token)
            throws JsonParseException, JsonMappingException, IOException {
        byte[] decoded = Base64.getDecoder().decode(token);
        String decodedString = new String(decoded);
        // ruleid: jackson-unsafe-deserialization
        Car obj = objectMapper.readValue(
                decodedString,
                Car.class);
        return obj;
    }
}