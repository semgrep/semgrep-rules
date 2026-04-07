# ruleid: anthropic-hardcoded-api-key-ruby
client = Anthropic::Client.new(api_key: "sk-ant-api03-abcdef1234567890")

# ok: anthropic-hardcoded-api-key-ruby
client = Anthropic::Client.new(api_key: ENV["ANTHROPIC_API_KEY"])

# ok: anthropic-hardcoded-api-key-ruby
client = Anthropic::Client.new(api_key: get_secret("anthropic"))

# ok: anthropic-hardcoded-api-key-ruby
client = Anthropic::Client.new(api_key: "not-a-real-key")
