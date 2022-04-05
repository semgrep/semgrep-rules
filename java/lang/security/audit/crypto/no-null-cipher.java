import java.lang.Runtime;

class Cls {

    public Cls() {
        System.out.println("Hello");
    }

    public byte[] test1(String plainText) {
        Cipher doNothingCihper = new NullCipher();
        //The ciphertext produced will be identical to the plaintext.
        // ruleid: no-null-cipher
        byte[] cipherText = doNothingCihper.doFinal(plainText);
        return cipherText;
    }

    public void test2(String plainText) {
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        // ok: no-null-cipher
        byte[] cipherText = cipher.doFinal(plainText);
        return cipherText;
    }
}
