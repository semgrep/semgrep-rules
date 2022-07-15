module Test

    require 'openssl'

    class Test
        $pass = 'super secret'

        def initialize(key = nil, iv = nil)
			@pass1 = 'my secure pass phrase goes here'
			@keypem = 'foo.pem'
			#ruleid: hardcoded-secret-rsa-passphrase
			OpenSSL::PKey::RSA.new(1024).to_pem(cipher, "secret")
			bad
			bad1
			bad2
			bad3
			ok
        end


		def bad
			key_pem = File.read @keypem
			#ruleid: hardcoded-secret-rsa-passphrase
			key = OpenSSL::PKey::RSA.new key_pem, $pass
		end

		def bad1
			key_pem = File.read @keypem
            #ruleid: hardcoded-secret-rsa-passphrase
			key = OpenSSL::PKey::RSA.new key_pem, @pass1
			$bad0 = 'secret'
		end

        def bad2
			key_pem = File.read @keypem
            #ruleid: hardcoded-secret-rsa-passphrase
			key = OpenSSL::PKey::RSA.new key_pem, 'secret'
			#ruleid: hardcoded-secret-rsa-passphrase
			key = OpenSSL::PKey::RSA.new key_pem, $bad0
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
			  io.write ca_key.export(cipher, $pass)
			  #ruleid: hardcoded-secret-rsa-passphrase
			  io.write ca_key.export(cipher, @pass1)
			end
		end 

        def ok
			key_pem = File.read @keypem
            #ok: hardcoded-secret-rsa-passphrase
			key = OpenSSL::PKey::RSA.new key_pem, ENV['SECRET']
		end
end