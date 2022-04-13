class Test
    $key = 512
    $pass1 = 2048

    def initialize(key = nil, iv = nil)
        @key2 = 512
        @pass2 = 2048
        # ruleid: insufficient-rsa-key-size
        OpenSSL::PKey::RSA.new(@key2)
        # ruleid: insufficient-rsa-key-size
        OpenSSL::PKey::RSA.new 512
        bad
        bad1
        ok
    end

    def bad
        # ruleid: insufficient-rsa-key-size
        key = OpenSSL::PKey::RSA.new($key)
    end

    def bad1
        # ruleid: insufficient-rsa-key-size
        key = OpenSSL::PKey::RSA.new(@key2)
    end


    def ok
        # ok: insufficient-rsa-key-size
        key = OpenSSL::PKey::RSA.new($pass1)
        # ok: insufficient-rsa-key-size
        key = OpenSSL::PKey::RSA.new(@pass2)
        # ok: insufficient-rsa-key-size
        key = OpenSSL::PKey::RSA.new(2048)
    end
end