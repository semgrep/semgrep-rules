import java.lang.Runtime;

class Cls {

    public Cls() {
        System.out.println("Hello");
    }

    public byte[] test1(String plainText) {
        // ruleid: no-null-cipher
        javax.crypto.NullCipher nullCipher = new javax.crypto.NullCipher();
        // ruleid: no-null-cipher
        Cipher doNothingCihper = new NullCipher();
        //The ciphertext produced will be identical to the plaintext.
        byte[] cipherText = doNothingCihper.doFinal(plainText);
        return cipherText;
    }

    public void test2(String plainText) {
        // ok: no-null-cipher
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        byte[] cipherText = cipher.doFinal(plainText);
        return cipherText;
    }

    public void test3(String plainText) {
        // ruleid: no-null-cipher
        useCipher(new NullCipher());
    }

    private static void useCipher(Cipher cipher) throws Exception {
       // sast should complain about the hard-coded key
       SecretKey key = new SecretKeySpec("secret".getBytes("UTF-8"), "AES");
       cipher.init(Cipher.ENCRYPT_MODE, key);
       byte[] plainText  = "aeiou".getBytes("UTF-8");
       byte[] cipherText = cipher.doFinal(plainText);
       System.out.println(new String(cipherText));
    }
}
