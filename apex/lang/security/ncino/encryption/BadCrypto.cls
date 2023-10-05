/*
* Test controller with bad Crypto class usage
*/
public with sharing class BadCrypto {

	public void badCryptoEncryption() {
		// ruleid: bad-crypto
		Blob hardCodedIV = Blob.valueOf('Hardcoded IV 123');
		// ruleid: bad-crypto
		Blob hardCodedKey = Blob.valueOf('0000000000000000');
		Blob data = Blob.valueOf('Data to be encrypted');
		Blob encrypted = Crypto.encrypt('AES128', hardCodedKey, hardCodedIV, data);
	}

	public void badCryptoEncryptionHarcodedIvOnly() {
		// ruleid: bad-crypto
		Blob hardCodedIV = Blob.valueOf('Hardcoded IV 123');
		// ok: bad-crypto
		Blob key = Blob.valueOf(generateEncryptionKey());
		Blob data = Blob.valueOf('Data to be encrypted');
		Blob encrypted = Crypto.encrypt('AES128', key, hardCodedIV, data);
	}

	public void badCryptoEncryptionHarcodedKeyOnly() {
		// ok: bad-crypto
		Blob IV = Blob.valueOf(generateEncryptionIV());
		// ruleid: bad-crypto
		Blob hardCodedKey = Blob.valueOf('0000000000000000');
		Blob data = Blob.valueOf('Data to be encrypted');
		Blob encrypted = Crypto.encrypt('AES128', hardCodedKey, IV, data);
	}

	public void goodCryptoEncryption() {
		// ok: bad-crypto
		Blob IV = Blob.valueOf(getRandomValue());
		// ok: bad-crypto
		Blob key = Blob.valueOf(getRandomValue());
		Blob data = Blob.valueOf('Data to be encrypted');
		Blob encrypted = Crypto.encrypt('AES128', key, IV, data);
	}

	public void badCryptoDecryption() {
		Blob encryptedCipherText = Blob.valueOf('Some encrypted cipher text');
		// ruleid: bad-crypto
		Blob hardCodedIV = Blob.valueOf('Hardcoded IV 123');
		// ruleid: bad-crypto
		Blob hardCodedKey = Blob.valueOf('0000000000000000');
		Blob decryptedCipherText = Crypto.decrypt('AES128', hardCodedKey, hardCodedIV, encryptedCipherText);
	}

	public void badCryptoDecryptionHarcodedIvOnly() {
		Blob encryptedCipherText = Blob.valueOf('Some encrypted cipher text');
		// ruleid: bad-crypto
		Blob hardCodedIV = Blob.valueOf('Hardcoded IV 123');
		// ok: bad-crypto
		Blob key = Blob.valueOf(generateEncryptionKey());
		Blob encrypted = Crypto.encrypt('AES128', key, hardCodedIV, data);
	}

	public void badCryptoDecryptionHarcodedKeyOnly() {
		Blob encryptedCipherText = Blob.valueOf('Some encrypted cipher text');
		// ok: bad-crypto
		Blob IV = Blob.valueOf(generateEncryptionIV());
		// ruleid: bad-crypto
		Blob hardCodedKey = Blob.valueOf('0000000000000000');
		Blob encrypted = Crypto.encrypt('AES128', hardCodedKey, IV, data);
	}

	public void goodCryptoDecryption() {
		Blob encryptedCipherText = Blob.valueOf('Some encrypted cipher text');
		// ok: bad-crypto
		Blob IV = Blob.valueOf(generateEncryptionIV());
		// ok: bad-crypto
		Blob key = Blob.valueOf(getRandomValue());
		Blob encrypted = Crypto.encrypt('AES128', key, IV, data);
	}
}
