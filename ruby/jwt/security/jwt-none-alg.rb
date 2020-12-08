require 'jwt'

def bad1
    payload = { data: 'test' }
    # ruleid: ruby-jwt-none-alg
    token = JWT.encode payload, nil, 'none'
    puts token
end

def ok1(hmac_secret)
    # ok: ruby-jwt-none-alg
    token = JWT.encode payload, hmac_secret, 'HS256'
    puts token
    decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
    puts decoded_token
end
