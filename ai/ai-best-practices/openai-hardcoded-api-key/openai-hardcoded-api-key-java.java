import com.theokanning.openai.service.OpenAiService;

class Example {
    void test() {
        // ruleid: openai-hardcoded-api-key-java
        OpenAiService service = new OpenAiService("sk-1234567890abcdef");

        // ok: openai-hardcoded-api-key-java
        OpenAiService service2 = new OpenAiService(System.getenv("OPENAI_API_KEY"));

        // ok: openai-hardcoded-api-key-java
        OpenAiService service3 = new OpenAiService(apiKey);

        // ok: openai-hardcoded-api-key-java
        OpenAiService service4 = new OpenAiService("not-a-real-key");
    }
}
