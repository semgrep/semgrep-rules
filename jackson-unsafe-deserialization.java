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
        //objectMapper.enableDefaultTyping();

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