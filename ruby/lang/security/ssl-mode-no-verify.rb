# cf. https://github.com/presidentbeef/brakeman/blob/v3.6.2/docs/warning_types/ssl_verification_bypass/index.markdown 

require "net/https"
require "uri"

uri = URI.parse("https://ssl-site.com/")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
# ruleid:ssl-mode-no-verify
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)

http.verify_mode = OpenSSL::SSL::VERIFY_PEER

response = http.request(request)

# ok:ssl-mode-no-verify
http.verify_mode = OpenSSL::SSL::VERIFY_PEER
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
