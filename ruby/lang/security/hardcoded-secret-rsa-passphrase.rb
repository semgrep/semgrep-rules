module Test

    require 'openssl'

    class Test
        @pass = 'pass phrase goes here1'

        def assign(key = nil, iv = nil)
			@pass1 = 'my secure pass phrase goes here'
			#ruleid: hardcoded-secret-rsa-passphrase
			OpenSSL::PKey::RSA.new(1024).to_pem(cipher, "secret")
        end


		def bad
			key_pem = File.read @fileWithKeyName
			#ruleid: hardcoded-secret-rsa-passphrase
			key = OpenSSL::PKey::RSA.new key_pem, @pass
		end

		def bad1
			key_pem = File.read @fileWithKeyName
            #ruleid: hardcoded-secret-rsa-passphrase
			key = OpenSSL::PKey::RSA.new key_pem, @pass1
		end

        def bad2
			key_pem = File.read @fileWithKeyName
            #ruleid: hardcoded-secret-rsa-passphrase
			key = OpenSSL::PKey::RSA.new key_pem, 'secret'
		end

		def bad3 
			ca_key = OpenSSL::PKey::RSA.new 2048
			pass_phrase = 'my secure pass phrase goes here'
			cipher = OpenSSL::Cipher.new 'AES-256-CBC'
			#ruleid: hardcoded-secret-rsa-passphrase
			ca_key.export(cipher, pass_phrase)
			open 'tmp/ca_key.pem', 'w', 0644 do |io|
			  #ruleid: hardcoded-secret-rsa-passphrase
			  io.write ca_key.export(cipher, pass_phrase)
			  #ruleid: hardcoded-secret-rsa-passphrase
			  io.write ca_key.export(cipher, @pass)
			  #ruleid: hardcoded-secret-rsa-passphrase
			  io.write ca_key.export(cipher, @pass1)
			end
		end 

        def ok
			key_pem = File.read @fileWithKeyName
            #ok: hardcoded-secret-rsa-passphrase
			key = OpenSSL::PKey::RSA.new key_pem, ENV['SECRET']
		end

		def bad_intrafunction
		pass2 = 'omgsosekrit'
		key_pem = File.read @fileWithKeyName
        #ruleid: hardcoded-secret-rsa-passphrase
		key = OpenSSL::PKey::RSA.new key_pem, pass2
    end

end