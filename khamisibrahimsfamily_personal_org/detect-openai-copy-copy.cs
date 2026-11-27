// ruleid: detect-openai
using OpenAI.Chat;

// ruleid: detect-openai
ChatClient client = new("gpt-3.5-turbo", Environment.GetEnvironmentVariable("OPENAI_API_KEY"));

// ruleid: detect-openai
ChatCompletion chatCompletion = client.CompleteChat(
    [
        new UserChatMessage("Say 'this is a test.'")
    ]);
