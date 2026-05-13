import com.anthropic.client.AnthropicClient;

class Example {
    void test() {
        // ruleid: anthropic-hardcoded-api-key-java
        AnthropicClient client = AnthropicClient.builder().apiKey("sk-ant-api03-abcdef1234567890").build();

        // ok: anthropic-hardcoded-api-key-java
        AnthropicClient client2 = AnthropicClient.builder().apiKey(System.getenv("ANTHROPIC_API_KEY")).build();

        // ok: anthropic-hardcoded-api-key-java
        AnthropicClient client3 = AnthropicClient.builder().apiKey(apiKey).build();
    }
}
