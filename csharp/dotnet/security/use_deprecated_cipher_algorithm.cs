using System;
using System.Security.Cryptography;
					
public class Encryption
{
	public void CreateAes1() {
		//ok: use_deprecated_cipher_algorithm
		var key = Aes.Create();
	}
	
	public void CreateAes2() {
		//ok: use_deprecated_cipher_algorithm
		var key = Aes.Create("ImplementationName");
	}

	public void CreateRijndael1() {
		//ok: use_deprecated_cipher_algorithm
		var key = Rijndael.Create();
	}
	
	public void CreateRijndael2() {
		//ok: use_deprecated_cipher_algorithm
		var key = Rijndael.Create("ImplementationName");
	}

	public void CreateDES1() {
		//ruleid: use_deprecated_cipher_algorithm
		var key = DES.Create();
	}
	
	public void CreateDES2() {
		//ruleid: use_deprecated_cipher_algorithm
		var key = DES.Create("ImplementationName");
	}

	public void CreateTripleDES1() {
		//ok: use_deprecated_cipher_algorithm
		var key = TripleDES.Create();
	}
	
	public void CreateTripleDES2() {
		//ok: use_deprecated_cipher_algorithm
		var key = TripleDES.Create("ImplementationName");
	}

	public void CreateRC21() {
		//ruleid: use_deprecated_cipher_algorithm
		var key = RC2.Create();
	}
	
	public void CreateRC22() {
		//ruleid: use_deprecated_cipher_algorithm
		var key = RC2.Create("ImplementationName");
	}
}