// ruleid: detect-gemini
import GoogleGenerativeAI

// Access your API key from your on-demand resource .plist file (see "Set up your API key" above)
// ruleid: detect-gemini
let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: APIKey.default)

let prompt = "Write a story about a magic backpack."
let response = try await model.generateContent(prompt)
if let text = response.text {
  print(text)
}