using System;
using System.Security.Cryptography;
					
public class RSAEncryption
{
	public static void EncryptWithBadPadding1()
	{
		RSA key = RSA.Create();
		byte[] msg = new byte[16];
		Type t = typeof(byte[]);
		RSAPKCS1KeyExchangeFormatter formatter = new RSAPKCS1KeyExchangeFormatter(key);
		//ruleid: use_weak_rsa_encryption_padding
		byte[] cipherText = formatter.CreateKeyExchange(msg, t);
	}
	
	public static void DecryptWithBadPadding()
	{
		RSA key = RSA.Create();
		byte[] ciphertext = new byte[16];
		var deformatter = new RSAPKCS1KeyExchangeDeformatter(key);
		//ruleid: use_weak_rsa_encryption_padding
		var plaintext = deformatter.DecryptKeyExchange(ciphertext);
	}

	public static void EncryptWithBadPadding2()
	{
		RSA key = RSA.Create();
		byte[] msg = new byte[16];
		var formatter = new RSAPKCS1KeyExchangeFormatter(key);
		//ruleid: use_weak_rsa_encryption_padding
		byte[] cipherText = formatter.CreateKeyExchange(msg);
	}

	public static void EncryptWithGoodPadding1()
	{
		RSA key = RSA.Create();
		byte[] msg = new byte[16];
		Type t = typeof(byte[]);
		AsymmetricKeyExchangeFormatter formatter = new RSAOAEPKeyExchangeFormatter(key);
		//ok: use_weak_rsa_encryption_padding
		byte[] cipherText = formatter.CreateKeyExchange(msg, t);
	}
	
	public static void EncryptWithGoodPadding2()
	{
		RSA key = RSA.Create();
		byte[] msg = new byte[16];
		AsymmetricKeyExchangeFormatter formatter = new RSAOAEPKeyExchangeFormatter(key);
		//ok: use_weak_rsa_encryption_padding
		byte[] cipherText = formatter.CreateKeyExchange(msg);
	}

	public static void DecryptWithGoodPadding()
	{
		RSA key = RSA.Create();
		byte[] ciphertext = new byte[16];
		var deformatter = new RSAOAEPKeyExchangeDeformatter(key);
		//ok: use_weak_rsa_encryption_padding
		var plaintext = deformatter.DecryptKeyExchange(ciphertext);
	}

	
	public static void Main(string[] args){
	}
}
