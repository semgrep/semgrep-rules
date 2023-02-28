class Blowfish{
  public void useofBlowfish() {
    // ruleid: use-of-blowfish
    Cipher.getInstance("Blowfish");
  }

  public void useofBlowfish2() {
    // ruleid: use-of-blowfish
    useCipher(Cipher.getInstance("Blowfish"));
  }

  public void ok() {
    // ok: use-of-blowfish
    Cipher.getInstance("AES/CBC/PKCS7PADDING");
  }
}
