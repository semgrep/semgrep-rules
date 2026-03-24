package main

func main() {
	// ruleid: llm-api-key-in-source-go
	apiKey := "sk-abcdefghijklmnopqrstuvwxyz1234567890"

	// ruleid: llm-api-key-in-source-go
	var anthropicKey = "sk-ant-api03-abcdefghijklmnopqrstuvwxyz"

	// ruleid: llm-api-key-in-source-go
	googleKey := "AIzaSyAbcdefghijklmnopqrstuvwxyz1234567890"

	// ruleid: llm-api-key-in-source-go
	hfToken := "hf_abcdefghijklmnopqrstuvwxyz1234"

	// ok: llm-api-key-in-source-go
	apiKey2 := os.Getenv("OPENAI_API_KEY")

	// ok: llm-api-key-in-source-go
	shortKey := "sk-short"

	// ok: llm-api-key-in-source-go
	notAKey := "hello world"
}
