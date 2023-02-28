class AES{
  public void useofAES() {
    // ruleid: use-of-default-aes
    Cipher.getInstance("AES");
  }

  public void useofAES2() {
    // ruleid: use-of-default-aes
    useCipher(Cipher.getInstance("AES"));
  }

  public void ok() {
    // ok: use-of-default-aes
    Cipher.getInstance("AES/CBC/PKCS7PADDING");
  }
}
