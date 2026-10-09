package main

import (
	"github.com/anthropics/anthropic-sdk-go"
	"github.com/anthropics/anthropic-sdk-go/option"
)

func main() {
	// ruleid: anthropic-hardcoded-api-key-go
	client := anthropic.NewClient(option.WithAPIKey("sk-ant-api03-abcdef1234567890"))

	// ok: anthropic-hardcoded-api-key-go
	client := anthropic.NewClient(option.WithAPIKey(os.Getenv("ANTHROPIC_API_KEY")))

	// ok: anthropic-hardcoded-api-key-go
	client := anthropic.NewClient(option.WithAPIKey(apiKey))
}
