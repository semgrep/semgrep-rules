require 'net/http'

def bad1
    # ruleid: net-http-request
    uri = URI('http://example.com/index.html?count=10')
    Net::HTTP.get(uri) # => String
end

def bad2
    # ruleid: net-http-request
    uri = URI('http://www.example.com/search.cgi')
    res = Net::HTTP.post_form(uri, 'q' => 'ruby', 'max' => '50')
    puts res.body
end

def bad3
    # ruleid: net-http-request
    uri = URI('http://example.com/some_path?query=string')

    Net::HTTP.start(uri.host, uri.port) do |http|
    request = Net::HTTP::Get.new uri

    response = http.request request # Net::HTTPResponse object
    end
end

def bad4
    # ruleid: net-http-request
    uri = URI('http://example.com/some_path?query=string')

    Net::HTTP.start(uri.host, uri.port) do |http|
    request = Net::HTTP::Get.new(uri)

    response = http.request request # Net::HTTPResponse object
    end
end

def bad5
    # ruleid: net-http-request
    Net::HTTP.get(URI('http://www.example.com/index.html'))
end

def ok1
    # ok: net-http-request
    uri = URI('https://example.com/index.html?count=10')
    Net::HTTP.get(uri) # => String
end

def ok2
    # ok: net-http-request
    uri = URI('https://www.example.com/search.cgi')
    res = Net::HTTP.post_form(uri, 'q' => 'ruby', 'max' => '50')
    puts res.body
end

def ok3
    # ok: net-http-request
    uri = URI('https://example.com/some_path?query=string')

    Net::HTTP.start(uri.host, uri.port) do |http|
    request = Net::HTTP::Get.new uri

    response = http.request request # Net::HTTPResponse object
    end
end

def ok4
    # ok: net-http-request
    uri = URI('https://example.com/some_path?query=string')

    Net::HTTP.start(uri.host, uri.port) do |http|
    request = Net::HTTP::Get.new(uri)

    response = http.request request # Net::HTTPResponse object
    end
end

def ok5
    # ok: net-http-request
    Net::HTTP.get(URI('https://www.example.com/index.html'))
end
