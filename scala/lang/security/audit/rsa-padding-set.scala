class RSACipher {
  def RSACipher(): Void =
    try {
      // ruleid: ecb-cipher
      val c = Cipher.getInstance("RSA/None/NoPadding")
      c.init(Cipher.ENCRYPT_MODE, k, iv)
      val cipherText = c.doFinal(plainText)
    } catch {
      case NonFatal(e) => throw new RuntimeException("Encrypt error", e)
    }

  def ecbCipher2(): Void =
    try {
      // ruleid: ecb-cipher
      var c = Cipher.getInstance("AES/ECB/NoPadding")
      c.init(Cipher.ENCRYPT_MODE, k, iv)
      val cipherText = c.doFinal(plainText)
    } catch {
      case NonFatal(e) => throw new RuntimeException("Encrypt error", e)
    }

  def okRSACipher(): Void =
    try {
      // ok: ecb-cipher
      var c = Cipher.getInstance("RSA/ECB/OAEPWithMD5AndMGF1Padding")
      c.init(Cipher.ENCRYPT_MODE, k, iv)
      val cipherText = c.doFinal(plainText)
    } catch {
      case NonFatal(e) => throw new RuntimeException("Encrypt error", e)
    }
}
