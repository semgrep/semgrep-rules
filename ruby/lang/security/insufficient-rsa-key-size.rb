

module Test

    require 'openssl'
    @value = 512
    # ok: insufficient-rsa-key-size
    OpenSSL::PKey::RSA.new 2048

    # ruleid: insufficient-rsa-key-size
    key = OpenSSL::PKey::RSA.new(512, 3)

    # ruleid: insufficient-rsa-key-size
    OpenSSL::PKey::RSA.new 512

    y = 512
    # ruleid: insufficient-rsa-key-size
    key = OpenSSL::PKey::RSA.new(y)


    class Test
        @key = 512
        @pass1 = 2048

        def assign(key = nil, iv = nil)
			@key2 = 512
			# ruleid: insufficient-rsa-key-size
			OpenSSL::PKey::RSA.new(@key2)
        end


		def bad
			# ruleid: insufficient-rsa-key-size
			key = OpenSSL::PKey::RSA.new(@key)
		end

        def bad1
            # ruleid: insufficient-rsa-key-size
			key = OpenSSL::PKey::RSA.new(@key2)
		end


        def ok
			key_pem = File.read @fileWithKeyName
            # ok: insufficient-rsa-key-size
			key = OpenSSL::PKey::RSA.new(@pass1)
            # ok: insufficient-rsa-key-size
			key = OpenSSL::PKey::RSA.new(2048)
		end

end