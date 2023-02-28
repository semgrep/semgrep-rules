class RC2{
  public void useofRC2() {
    // ruleid: use-of-rc2
    Cipher.getInstance("RC2");
  }

  public void useofRC2b() {
    // ruleid: use-of-rc2 
    useCipher(Cipher.getInstance("RC2"));
  }

  public void ok() {
    // ok: use-of-rc2
    Cipher.getInstance("AES/CBC/PKCS7PADDING");
  }
}
