class AES{
  public void useofAES() {
    // ruleid: use-of-aes-ecb
    Cipher.getInstance("AES/ECB/NoPadding");
  }

  public void useofAES2() {
    // ruleid: use-of-aes-ecb
    useCipher(Cipher.getInstance("AES/ECB/PKCS5Padding"));
  }

  public void useofAES_lowercase() {
    // ruleid: use-of-aes-ecb
    Cipher.getInstance("aes/ecb/nopadding");
  }

  public void useofAES_mixedcase() {
    // ruleid: use-of-aes-ecb
    Cipher.getInstance("Aes/Ecb/NoPadding");
  }

  public void ok() {
    // ok: use-of-aes-ecb
    Cipher.getInstance("AES/CBC/PKCS7PADDING");
  }
}
