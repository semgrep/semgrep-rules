import java.lang.Runtime

class Cls {
    public fun test1(plainText: String): Array<Byte> {
        // ruleid: no-null-cipher
        val doNothingCipher: Cipher = NullCipher()
        //The ciphertext produced will be identical to the plaintext.
        val cipherText: Cipher = doNothingCihper.doFinal(plainText)
        return cipherText
    }

    public fun test2(plainText: String): Void {
        // ok: no-null-cipher
        val cipher: Cipher = Cipher.getInstance("AES/CBC/PKCS5Padding")
        val cipherText: Array<Byte> = cipher.doFinal(plainText)
        return cipherText
    }
}
