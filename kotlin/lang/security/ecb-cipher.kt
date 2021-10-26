class ECBCipher {

  public fun ecbCipher(): Void {
    // ruleid: ecb-cipher
    val c: Cipher = Cipher.getInstance("AES/ECB/NoPadding")
    c.init(Cipher.ENCRYPT_MODE, k, iv)
    val cipherText = c.doFinal(plainText)
  }

  public fun ecbCipher2(): Void {
    // ruleid: ecb-cipher
    var c = Cipher.getInstance("AES/ECB/NoPadding")
    c.init(Cipher.ENCRYPT_MODE, k, iv)
    val cipherText = c.doFinal(plainText)
  }

  public fun noEcbCipher(): Void {
    // ok: ecb-cipher
    var c = Cipher.getInstance("AES/GCM/NoPadding")
    c.init(Cipher.ENCRYPT_MODE, k, iv)
    val cipherText = c.doFinal(plainText)
  }
}
