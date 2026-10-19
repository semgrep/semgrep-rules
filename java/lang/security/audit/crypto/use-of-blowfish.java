class Blowfish{
  public void useofBlowfish() {
    // ruleid: use-of-blowfish
    Cipher.getInstance("Blowfish");
  }

  public void useofBlowfish2() {
    // ruleid: use-of-blowfish
    useCipher(Cipher.getInstance("Blowfish"));
  }

  public void useofBlowfish_lowercase() {
    // ruleid: use-of-blowfish
    Cipher.getInstance("blowfish");
  }

  public void useofBlowfish_uppercase() {
    // ruleid: use-of-blowfish
    Cipher.getInstance("BLOWFISH");
  }

  public void ok() {
    // ok: use-of-blowfish
    Cipher.getInstance("AES/CBC/PKCS7PADDING");
  }
}
