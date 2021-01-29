require 'httparty'

def bad1
  # ruleid: http-client-requests
  response = HTTParty.get('http://example.com', format: :plain)
  JSON.parse response, symbolize_names: true
end

def bad2
  # ruleid: http-client-requests
  str = 'http://example.com'
  # ruleid: http-client-requests
  response = HTTParty.get(str, format: :plain)
  JSON.parse response, symbolize_names: true
end

def bad3
  # ruleid: http-client-requests
  RestClient.get('http://example.com/resource')
end

def bad4
  # ruleid: http-client-requests
  RestClient.post "http://example.com/resource", {'x' => 1}.to_json, {content_type: :json, accept: :json}
end

def bad5
  # ruleid: http-client-requests
  RestClient::Request.execute(method: :get, url: 'http://httpbin.org/redirect/1', max_redirects: 0)
end

def ok1
  # ok: http-client-requests
  response = HTTParty.get('https://example.com', format: :plain)
  JSON.parse response, symbolize_names: true
end

def ok2
  # ok: http-client-requests
  str = 'https://example.com'
  response = HTTParty.get(str, format: :plain)
  JSON.parse response, symbolize_names: true
end

def ok3
  # ok: http-client-requests
  RestClient.get('https://example.com/resource')
end

def ok4
  # ok: http-client-requests
  RestClient.post "https://example.com/resource", {'x' => 1}.to_json, {content_type: :json, accept: :json}
end

def ok5
  # ok: http-client-requests
  RestClient::Request.execute(method: :get, url: 'https://httpbin.org/redirect/1', max_redirects: 0)
end
