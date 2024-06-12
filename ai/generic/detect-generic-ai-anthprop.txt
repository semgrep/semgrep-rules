# ruleid: detect-generic-ai-anthprop
import anthropic

# ruleid: detect-generic-ai-anthprop
client = anthropic.Anthropic(
    # defaults to os.environ.get("ANTHROPIC_API_KEY")
    api_key="my_api_key",
)

message = client.messages.create(
	# ruleid: detect-generic-ai-anthprop
    model="claude-3-opus-20240229",
    max_tokens=1024,
    messages=[
        {"role": "user", "content": "Hello, Claude"}
    ]
)
print(message.content)