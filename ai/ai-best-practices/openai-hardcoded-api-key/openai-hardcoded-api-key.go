package main

import "github.com/sashabaranov/go-openai"

func main() {
	// ruleid: openai-hardcoded-api-key-go
	client := openai.NewClient("sk-1234567890abcdef")

	// ok: openai-hardcoded-api-key-go
	client := openai.NewClient(os.Getenv("OPENAI_API_KEY"))

	// ok: openai-hardcoded-api-key-go
	client := openai.NewClient(apiKey)

	// ok: openai-hardcoded-api-key-go
	client := openai.NewClient("not-a-real-key")
}
