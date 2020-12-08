require 'jwt'

def bad1(hmac_secret)
    # ruleid: ruby-jwt-decode-without-verify
    decoded_token = JWT.decode token, hmac_secret, false, { algorithm: 'HS256' }
    puts decoded_token
end

def ok1(hmac_secret)
    # ok: ruby-jwt-decode-without-verify
    token = JWT.encode payload, hmac_secret, 'HS256'
    puts token
    decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
    puts decoded_token
end
