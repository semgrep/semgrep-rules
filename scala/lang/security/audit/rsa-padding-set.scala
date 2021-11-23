class RSACipher {
  def badRSACipher(): Void =
    try {
      // ruleid: rsa-padding-set
      val c = Cipher.getInstance("RSA/None/NoPadding")
      c.init(Cipher.ENCRYPT_MODE, k, iv)
      val cipherText = c.doFinal(plainText)
    } catch {
      case NonFatal(e) => throw new RuntimeException("Encrypt error", e)
    }

  def okRSACipher(): Void =
    try {
      // ok: rsa-padding-set
      var c = Cipher.getInstance("RSA/ECB/OAEPWithMD5AndMGF1Padding")
      c.init(Cipher.ENCRYPT_MODE, k, iv)
      val cipherText = c.doFinal(plainText)
    } catch {
      case NonFatal(e) => throw new RuntimeException("Encrypt error", e)
    }
}
