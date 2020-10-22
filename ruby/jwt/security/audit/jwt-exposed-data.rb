require 'jwt'

def bad1(hmac_secret, payload)
    # ruleid: ruby-jwt-exposed-data
    token = JWT.encode payload, hmac_secret, 'HS256'
    puts token
end

def ok1(hmac_secret)
    # ok: ruby-jwt-exposed-data
    payload = { data: 'data', nbf: nbf }
    token = JWT.encode payload, hmac_secret, 'HS256'
    puts token
end
