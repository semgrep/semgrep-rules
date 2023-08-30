/*
* Test controller with bad Crypto class usage
*/
public with sharing class BadCrypto {

	public void badCryptoEncryption() {
		// ruleid: apex.encryption.bad-crypto
		Blob hardCodedIV = Blob.valueOf('Hardcoded IV 123');
		// ruleid: apex.encryption.bad-crypto
		Blob hardCodedKey = Blob.valueOf('0000000000000000');
		Blob data = Blob.valueOf('Data to be encrypted');
		Blob encrypted = Crypto.encrypt('AES128', hardCodedKey, hardCodedIV, data);
	}

	public void badCryptoEncryptionHarcodedIvOnly() {
		// ruleid: apex.encryption.bad-crypto
		Blob hardCodedIV = Blob.valueOf('Hardcoded IV 123');
		// ok: apex.encryption.bad-crypto
		Blob key = Blob.valueOf(generateEncryptionKey());
		Blob data = Blob.valueOf('Data to be encrypted');
		Blob encrypted = Crypto.encrypt('AES128', key, hardCodedIV, data);
	}

	public void badCryptoEncryptionHarcodedKeyOnly() {
		// ok: apex.encryption.bad-crypto
		Blob IV = Blob.valueOf(generateEncryptionIV());
		// ruleid: apex.encryption.bad-crypto
		Blob hardCodedKey = Blob.valueOf('0000000000000000');
		Blob data = Blob.valueOf('Data to be encrypted');
		Blob encrypted = Crypto.encrypt('AES128', hardCodedKey, IV, data);
	}

	public void goodCryptoEncryption() {
		// ok: apex.encryption.bad-crypto
		Blob IV = Blob.valueOf(getRandomValue());
		// ok: apex.encryption.bad-crypto
		Blob key = Blob.valueOf(getRandomValue());
		Blob data = Blob.valueOf('Data to be encrypted');
		Blob encrypted = Crypto.encrypt('AES128', key, IV, data);
	}

	public void badCryptoDecryption() {
		Blob encryptedCipherText = Blob.valueOf('Some encrypted cipher text');
		// ruleid: apex.encryption.bad-crypto
		Blob hardCodedIV = Blob.valueOf('Hardcoded IV 123');
		// ruleid: apex.encryption.bad-crypto
		Blob hardCodedKey = Blob.valueOf('0000000000000000');
		Blob decryptedCipherText = Crypto.decrypt('AES128', hardCodedKey, hardCodedIV, encryptedCipherText);
	}

	public void badCryptoDecryptionHarcodedIvOnly() {
		Blob encryptedCipherText = Blob.valueOf('Some encrypted cipher text');
		// ruleid: apex.encryption.bad-crypto
		Blob hardCodedIV = Blob.valueOf('Hardcoded IV 123');
		// ok: apex.encryption.bad-crypto
		Blob key = Blob.valueOf(generateEncryptionKey());
		Blob encrypted = Crypto.encrypt('AES128', key, hardCodedIV, data);
	}

	public void badCryptoDecryptionHarcodedKeyOnly() {
		Blob encryptedCipherText = Blob.valueOf('Some encrypted cipher text');
		// ok: apex.encryption.bad-crypto
		Blob IV = Blob.valueOf(generateEncryptionIV());
		// ruleid: apex.encryption.bad-crypto
		Blob hardCodedKey = Blob.valueOf('0000000000000000');
		Blob encrypted = Crypto.encrypt('AES128', hardCodedKey, IV, data);
	}

	public void goodCryptoDecryption() {
		Blob encryptedCipherText = Blob.valueOf('Some encrypted cipher text');
		// ok: apex.encryption.bad-crypto
		Blob IV = Blob.valueOf(generateEncryptionIV());
		// ok: apex.encryption.bad-crypto
		Blob key = Blob.valueOf(getRandomValue());
		Blob encrypted = Crypto.encrypt('AES128', key, IV, data);
	}
}
