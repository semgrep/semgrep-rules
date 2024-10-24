using System;
using System.Security.Cryptography;
					
public class Encryption
{
	public void EncryptWithAesEcb() {
		Aes key = Aes.Create();
		//ruleid: deeptodoruleid: use_ecb_mode
		key.Mode = CipherMode.ECB;
		using var encryptor = key.CreateEncryptor();
		byte[] msg = new byte[32];
		var cipherText = encryptor.TransformFinalBlock(msg, 0, msg.Length);
	}
	
	public void EncryptWithAesEcb2() {
		Aes key = Aes.Create();
		byte[] msg = new byte[32];
		//ruleid: deeptodoruleid: use_ecb_mode
		var cipherText = key.EncryptEcb(msg, PaddingMode.PKCS7);
	}
	
	public void DecryptWithAesEcb(byte[] cipherText) {
		Aes key = Aes.Create();
		//ruleid: deeptodoruleid: use_ecb_mode
		key.Mode = CipherMode.ECB;
		using var decryptor = key.CreateDecryptor();
		var msg = decryptor.TransformFinalBlock(cipherText, 0, cipherText.Length);
	}
	
	public void DecryptWithAesEcb2(byte[] cipherText) {
		Aes key = Aes.Create();
		//ruleid: deeptodoruleid: use_ecb_mode
		var msgText = key.DecryptEcb(cipherText, PaddingMode.PKCS7);
	}
	
	public void EncryptWith3DESEcb() {
		TripleDES key = TripleDES.Create();
		//ruleid: deeptodoruleid: use_ecb_mode
		key.Mode = CipherMode.ECB;
		using var encryptor = key.CreateEncryptor();
		byte[] msg = new byte[32];
		var cipherText = encryptor.TransformFinalBlock(msg, 0, msg.Length);
	}
	
	public void EncryptWith3DESEcb2() {
		TripleDES key = TripleDES.Create();
		byte[] msg = new byte[32];
		//ruleid: deeptodoruleid: use_ecb_mode
		var cipherText = key.EncryptEcb(msg, PaddingMode.PKCS7);
	}
	
	public void DecryptWith3DESEcb(byte[] cipherText) {
		TripleDES key = TripleDES.Create();
		//ruleid: deeptodoruleid: use_ecb_mode
		key.Mode = CipherMode.ECB;
		using var decryptor = key.CreateDecryptor();
		var msg = decryptor.TransformFinalBlock(cipherText, 0, cipherText.Length);
	}
	
	public void DecryptWith3DESEcb2(byte[] cipherText) {
		TripleDES key = TripleDES.Create();
		//ruleid: deeptodoruleid: use_ecb_mode
		var msgText = key.DecryptEcb(cipherText, PaddingMode.PKCS7);
	}
	
	public void EncryptWithEcb(SymmetricAlgorithm key) {
		//ruleid: deeptodoruleid: use_ecb_mode
		key.Mode = CipherMode.ECB;
		using var encryptor = key.CreateEncryptor();
		byte[] msg = new byte[32];
		var cipherText = encryptor.TransformFinalBlock(msg, 0, msg.Length);
	}
	
	public void EncryptWithEcb2(SymmetricAlgorithm key) {
		byte[] msg = new byte[32];
		//ruleid: deeptodoruleid: use_ecb_mode
		var cipherText = key.EncryptEcb(msg, PaddingMode.PKCS7);
	}
	
	public void DecryptWithEcb(SymmetricAlgorithm key, byte[] cipherText) {
		//ruleid: deeptodoruleid: use_ecb_mode
		key.Mode = CipherMode.ECB;
		using var decryptor = key.CreateDecryptor();
		var msg = decryptor.TransformFinalBlock(cipherText, 0, cipherText.Length);
	}
	
	public void DecryptWithEcb2(SymmetricAlgorithm key, byte[] cipherText) {
		//ruleid: deeptodoruleid: use_ecb_mode
		var msgText = key.DecryptEcb(cipherText, PaddingMode.PKCS7);
	}
	
	public void EncryptWithAesCbc() {
		Aes key = Aes.Create();
		//ok: use_ecb_mode
		key.Mode = CipherMode.CBC;
		using var encryptor = key.CreateEncryptor();
		byte[] msg = new byte[32];
		var cipherText = encryptor.TransformFinalBlock(msg, 0, msg.Length);
	}
	
	public void EncryptWithAesCbc2() {
		Aes key = Aes.Create();
		byte[] msg = new byte[32];
		byte[] iv = new byte[16];
		//ok: use_ecb_mode
		var cipherText = key.EncryptCbc(msg, iv, PaddingMode.PKCS7);
	}
	
	public void DecryptWithAesCbc(byte[] cipherText) {
		Aes key = Aes.Create();
		//ok: use_ecb_mode		
		key.Mode = CipherMode.CBC;
		using var decryptor = key.CreateDecryptor();
		var msg = decryptor.TransformFinalBlock(cipherText, 0, cipherText.Length);
	}
	
	public void DecryptWithAesCbc2(byte[] cipherText, byte[] iv) {
		Aes key = Aes.Create();
		//ok: use_ecb_mode		
		var msgText = key.DecryptCbc(cipherText, iv, PaddingMode.PKCS7);
	}	
	
	public static void Main()
	{
		Console.WriteLine("Hello World");
	}
}
