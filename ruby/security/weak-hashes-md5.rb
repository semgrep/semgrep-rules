require 'digest'
class bad_md5
    def bad_md5_code() 
        md5 = Digest::MD5.hexdigest 'abc' 
        md5 = Digest::MD5.new
        md5 = Digest::MD5.base64digest 'abc'
        md5 = Digest::MD5.digest 'abc'
        
        digest = OpenSSL::Digest::MD5.new
        digest = OpenSSL::Digest::MD5.hexdigest 'abc' 
        digest = OpenSSL::Digest::MD5.new
        digest = OpenSSL::Digest::MD5.base64digest 'abc'
        digest = OpenSSL::Digest::MD5.digest 'abc'
    end
end
