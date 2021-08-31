require 'net/http'

def foo

  url = params[:url]
  # ruleid: avoid-tainted-http-request
  Net::HTTP.get(url, "/index.html")

  # ruleid: avoid-tainted-http-request
  Net::HTTP.get_response(params[:url])

  uri = URI(params[:url])
  # ruleid: avoid-tainted-http-request
  Net::HTTP.post(uri)

  # ruleid: avoid-tainted-http-request
  Net::HTTP.post_form(URI(params[:url]))

  uri = URI(params[:server])
  # ruleid: avoid-tainted-http-request
  req = Net::HTTP::Get.new uri

  # ruleid: avoid-tainted-http-request
  Net::HTTP.start(uri.host, uri.port) do |http|
    # ruleid: avoid-tainted-http-request
    req = Net::HTTP::Get.new uri
    resp = http.request request
  end

  # ruleid: avoid-tainted-http-request
  Net::HTTP::Get.new(params[:url])

  # ruleid: avoid-tainted-http-request
  Net::HTTP::Post.new(URI(params[:url]))


  # ok: avoid-tainted-http-request
  Net::HTTP.get("example.com", "/index.html")

  uri = URI("example.com/index.html")
  # ok: avoid-tainted-http-request
  Net::HTTP::Get.new(uri)

end
