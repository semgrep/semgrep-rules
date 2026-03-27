import com.google.cloud.vertexai.generativeai.GenerativeModel;

class Example {
    void test() {
        // ruleid: gemini-hardcoded-api-key-java
        GenerativeModel model = GenerativeModel.builder().apiKey("AIzaSyA1234567890abcdefghijklmnopqrs").build();

        // ok: gemini-hardcoded-api-key-java
        GenerativeModel model2 = GenerativeModel.builder().apiKey(System.getenv("GOOGLE_API_KEY")).build();

        // ok: gemini-hardcoded-api-key-java
        GenerativeModel model3 = GenerativeModel.builder().apiKey(apiKey).build();
    }
}
