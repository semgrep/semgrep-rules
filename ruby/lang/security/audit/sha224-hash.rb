require 'digest'
class Bad_sha224
    def bad_sha224_code()
        # ruleid: sha224-hash
        sha = Digest::SHA224.hexdigest 'abc'
        # ruleid: sha224-hash
        sha = Digest::SHA224.new
        # ruleid: sha224-hash
        sha = Digest::SHA224.base64digest 'abc'
        # ruleid: sha224-hash
        sha = Digest::SHA224.digest 'abc'

        # ruleid: sha224-hash
        digest = OpenSSL::Digest::SHA224.new
        # ruleid: sha224-hash
        digest = OpenSSL::Digest::SHA224.hexdigest 'abc'
        # ruleid: sha224-hash
        digest = OpenSSL::Digest::SHA224.new
        # ruleid: sha224-hash
        digest = OpenSSL::Digest::SHA224.base64digest 'abc'
        # ruleid: sha224-hash
        digest = OpenSSL::Digest::SHA224.digest 'abc'
        # ruleid: sha224-hash
        OpenSSL::HMAC.hexdigest("sha224", key, data)
        # ok: sha224-hash
        OpenSSL::HMAC.hexdigest("SHA256", key, data)
        # ok: sha224-hash
        digest = OpenSSL::Digest::SHA256.new
        # ok: sha224-hash
        digest = OpenSSL::Digest::SHA256.hexdigest 'abc'

        # ruleid: sha224-hash
        digest = OpenSSL::Digest.new('SHA224')
        
        # ruleid: sha224-hash
        digest = OpenSSL::Digest.new('SHA512-224')

        # ruleid: sha224-hash
        digest = OpenSSL::Digest.new('SHA3-224')

        # ruleid: sha224-hash
        hmac = OpenSSL::HMAC.new(key, 'sha224')

        # ruleid: sha224-hash
        hmac = OpenSSL::HMAC.new(key, 'SHA224')

    end
end
