# ruleid: llm-api-key-in-source-ruby
api_key = "sk-abcdefghijklmnopqrstuvwxyz1234567890"

# ruleid: llm-api-key-in-source-ruby
anthropic_key = "sk-ant-api03-abcdefghijklmnopqrstuvwxyz"

# ruleid: llm-api-key-in-source-ruby
google_key = "AIzaSyAbcdefghijklmnopqrstuvwxyz1234567890"

# ruleid: llm-api-key-in-source-ruby
hf_token = "hf_abcdefghijklmnopqrstuvwxyz1234"

# ok: llm-api-key-in-source-ruby
api_key = ENV["OPENAI_API_KEY"]

# ok: llm-api-key-in-source-ruby
short_key = "sk-short"

# ok: llm-api-key-in-source-ruby
not_a_key = "hello world"
