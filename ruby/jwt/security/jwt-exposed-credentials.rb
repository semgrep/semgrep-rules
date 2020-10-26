require 'jwt'

def bad1(hmac_secret)
    # ruleid: ruby-jwt-exposed-credentials
    payload = { data: 'data', password: 12345 }
    token = JWT.encode payload, hmac_secret, 'HS256'
    puts token
end

def ok1(hmac_secret)
    # ok: ruby-jwt-exposed-credentials
    payload = { data: 'data', nbf: nbf }
    token = JWT.encode payload, hmac_secret, 'HS256'
    puts token
end
