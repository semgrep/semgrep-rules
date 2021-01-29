require 'digest'
class bad_md5
    def bad_md5_code()
        # ruleid: weak-hashes-sha1
        sha = Digest::SHA1.hexdigest 'abc'
        # ruleid: weak-hashes-sha1
        sha = Digest::SHA1.new
        # ruleid: weak-hashes-sha1
        sha = Digest::SHA1.base64digest 'abc'
        # ruleid: weak-hashes-sha1
        sha = Digest::SHA1.digest 'abc'

        # ruleid: weak-hashes-sha1
        digest = OpenSSL::Digest::SHA1.new
        # ruleid: weak-hashes-sha1
        digest = OpenSSL::Digest::SHA1.hexdigest 'abc'
        # ruleid: weak-hashes-sha1
        digest = OpenSSL::Digest::SHA1.new
        # ruleid: weak-hashes-sha1
        digest = OpenSSL::Digest::SHA1.base64digest 'abc'
        # ruleid: weak-hashes-sha1
        digest = OpenSSL::Digest::SHA1.digest 'abc'
        # ruleid: weak-hashes-sha1
        OpenSSL::HMAC.hexdigest("sha1", key, data)
        # ok: weak-hashes-sha1
        OpenSSL::HMAC.hexdigest("SHA256", key, data)
        # ok: weak-hashes-sha1
        digest = OpenSSL::Digest::SHA256.new
        # ok: weak-hashes-sha1
        digest = OpenSSL::Digest::SHA256.hexdigest 'abc'
    end
end
