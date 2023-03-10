require 'jwt'

secret = "sampleSecret"
payload = {}
payload[:iat] = Time.now.to_i
payload[:email] = "sample@mail.com"
payload[:name] = "john doe"
token = JWT.encode payload, secret, 'HS256'

print token

def bad(token, secret)
    decoded_token = JWT.decode token, secret, false
    print decoded_token    
end


def ok(token, secret)
    decoded_token = JWT.decode token, secret, true
    print decoded_token
end