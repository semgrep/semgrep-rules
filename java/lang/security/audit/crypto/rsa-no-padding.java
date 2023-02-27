class RSAPadding {
  public void rsaNoPadding() {
    // ruleid: rsa-no-padding
    Cipher.getInstance("RSA/NONE/NoPadding");
  }

  public void rsaNoPadding2() {
    // ruleid: rsa-no-padding
    useCipher(Cipher.getInstance("RSA/None/NoPadding"));
  }

  public void rsaPadding() {
    // ok: rsa-no-padding
    Cipher.getInstance("RSA/ECB/OAEPWithMD5AndMGF1Padding");
  }
}
