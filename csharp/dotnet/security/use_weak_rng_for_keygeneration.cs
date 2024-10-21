using System;
using System.Security.Cryptography;
					
public class Program
{	
	public void GenerateBadKey() {
		var rng = new System.Random();
		byte[] key = new byte[16];
		rng.NextBytes(key);
		SymmetricAlgorithm cipher = Aes.Create();
		// ruleid: deeptodoruleid: use_weak_rng_for_keygeneration
		cipher.Key = key;
	}
	
	public void GenerateBadKeyGcm() {
		var rng = new System.Random();
		byte[] key = new byte[16];
		rng.NextBytes(key);
		// ruleid: use_weak_rng_for_keygeneration
		var cipher = new AesGcm(key);
	}
	
	public void GenerateGoodKey() {
		var rng = System.Security.Cryptography.RandomNumberGenerator.Create();
		byte[] key = new byte[16];
		rng.GetBytes(key);
		var cipher = Aes.Create();
		// ok: use_weak_rng_for_keygeneration
		cipher.Key = key;
	}

	public void GenerateGoodKeyGcm() {
		var rng = System.Security.Cryptography.RandomNumberGenerator.Create();
		byte[] key = new byte[16];
		rng.GetBytes(key);
		// ok: use_weak_rng_for_keygeneration
		var cipher = new AesGcm(key);
	}

	public void GenerateBadKeyCcm() {
		var rng = new System.Random();
		byte[] key = new byte[16];
		rng.NextBytes(key);
		// ruleid: use_weak_rng_for_keygeneration
		var cipher = new AesCcm(key);
	}

	public void GenerateGoodKeyCcm() {
		var rng = System.Security.Cryptography.RandomNumberGenerator.Create();
		byte[] key = new byte[16];
		rng.GetBytes(key);
		// ok: use_weak_rng_for_keygeneration
		var cipher = new AesCcm(key);
	}

	public void GenerateBadKeyChaCha20() {
		var rng = new System.Random();
		byte[] key = new byte[16];
		rng.NextBytes(key);
		// ruleid: use_weak_rng_for_keygeneration
		var cipher = new ChaCha20Poly1305(key);
	}

	public void GenerateGoodKeyChaCha20() {
		var rng = System.Security.Cryptography.RandomNumberGenerator.Create();
		byte[] key = new byte[16];
		rng.GetBytes(key);
		// ok: use_weak_rng_for_keygeneration
		var cipher = new ChaCha20Poly1305(key);
	}
}
