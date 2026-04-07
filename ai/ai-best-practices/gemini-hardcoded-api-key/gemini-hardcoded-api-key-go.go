package main

import (
	"cloud.google.com/go/vertexai/genai"
	"google.golang.org/api/option"
)

func main() {
	// ruleid: gemini-hardcoded-api-key-go
	client, _ := genai.NewClient(ctx, option.WithAPIKey("AIzaSyA1234567890abcdefghijklmnopqrs"))

	// ok: gemini-hardcoded-api-key-go
	client, _ := genai.NewClient(ctx, option.WithAPIKey(os.Getenv("GOOGLE_API_KEY")))

	// ok: gemini-hardcoded-api-key-go
	client, _ := genai.NewClient(ctx, option.WithAPIKey(apiKey))
}
