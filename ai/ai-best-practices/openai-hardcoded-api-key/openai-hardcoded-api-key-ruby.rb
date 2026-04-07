# ruleid: openai-hardcoded-api-key-ruby
client = OpenAI::Client.new(access_token: "sk-1234567890abcdef")

# ok: openai-hardcoded-api-key-ruby
client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])

# ok: openai-hardcoded-api-key-ruby
client = OpenAI::Client.new(access_token: get_secret("openai"))

# ok: openai-hardcoded-api-key-ruby
client = OpenAI::Client.new(access_token: "not-a-real-key")
