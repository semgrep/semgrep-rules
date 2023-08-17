import javax;

import javax.*;
// import javax.crypto;

import javax.crypto.*;
// import javax.crypto.Cipher;

class AES{
  public void useofAES() {
    // ruleid: use-of-default-aes
    Cipher.getInstance("AES");

    // ruleid: use-of-default-aes
    crypto.Cipher.getInstance("AES");

    // ruleid: use-of-default-aes
    javax.crypto.Cipher.getInstance("AES");

    // ok: use-of-default-aes
    KeyGenerator.getInstance("AES");

    // ok: use-of-default-aes
    crypto.KeyGenerator.getInstance("AES");

    // ok: use-of-default-aes
    javax.crypto.KeyGenerator.getInstance("AES");
  }

  public void useofAES2() {
    // ruleid: use-of-default-aes
    useCipher(Cipher.getInstance("AES"));

    // ruleid: use-of-default-aes
    useCipher(crypto.Cipher.getInstance("AES"));

    // ruleid: use-of-default-aes
    useCipher(javax.crypto.Cipher.getInstance("AES"));

    // ok: use-of-default-aes
    useCipher(KeyGenerator.getInstance("AES"));

    // ok: use-of-default-aes
    useCipher(crypto.KeyGenerator.getInstance("AES"));

    // ok: use-of-default-aes
    useCipher(javax.crypto.KeyGenerator.getInstance("AES"));
  }

  public void ok() {
    // ok: use-of-default-aes
    Cipher.getInstance("AES/CBC/PKCS7PADDING");

    // ok: use-of-default-aes
    crypto.Cipher.getInstance("AES/CBC/PKCS7PADDING");

    // ok: use-of-default-aes
    javax.crypto.Cipher.getInstance("AES/CBC/PKCS7PADDING");

    // ok: use-of-default-aes
    KeyGenerator.getInstance("AES/CBC/PKCS7PADDING");

    // ok: use-of-default-aes
    crypto.KeyGenerator.getInstance("AES/CBC/PKCS7PADDING");

    // ok: use-of-default-aes
    javax.crypto.KeyGenerator.getInstance("AES/CBC/PKCS7PADDING");
  }
}
