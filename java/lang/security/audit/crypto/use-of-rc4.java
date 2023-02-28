class RC4{
  public void useofRC4() {
    // ruleid: use-of-rc4 
    Cipher.getInstance("RC4");
  }

  public void useofRC4b() {
    // ruleid: use-of-rc4 
    useCipher(Cipher.getInstance("RC4"));
  }

  public void ok() {
    // ok: use-of-rc4 
    Cipher.getInstance("AES/CBC/PKCS7PADDING");
  }
}
