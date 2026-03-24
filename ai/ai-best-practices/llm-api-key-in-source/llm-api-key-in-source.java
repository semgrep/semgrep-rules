class Example {
    void test() {
        // ruleid: llm-api-key-in-source-java
        String apiKey = "sk-abcdefghijklmnopqrstuvwxyz1234567890";

        // ruleid: llm-api-key-in-source-java
        final String anthropicKey = "sk-ant-api03-abcdefghijklmnopqrstuvwxyz";

        // ruleid: llm-api-key-in-source-java
        String googleKey = "AIzaSyAbcdefghijklmnopqrstuvwxyz1234567890";

        // ruleid: llm-api-key-in-source-java
        String hfToken = "hf_abcdefghijklmnopqrstuvwxyz1234";

        // ok: llm-api-key-in-source-java
        String apiKey2 = System.getenv("OPENAI_API_KEY");

        // ok: llm-api-key-in-source-java
        String shortKey = "sk-short";

        // ok: llm-api-key-in-source-java
        String notAKey = "hello world";
    }
}
