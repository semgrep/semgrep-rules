import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class GcmHardcodedIV
{
    public static final int GCM_TAG_LENGTH = 16;
    public static final String BAD_IV = "ab0123456789";
    //It has not been found how to detect hardcoded byte arrays with semgrep
    //todoruleid: gcm-nonce-reuse
    public static final byte[] BAD_IV2 = new byte[]{0,1,2,3,4,5,6,7,8,9,10,11};

    private static byte[] theIV;
    private static SecretKey theKey;

    public static void main( String[] args )
    {
        String clearText = args[0];
        System.out.println(clearText);

        try {
            setKeys();

            String cipherText = encrypt(clearText);
            System.out.println(cipherText);

            String decrypted = decrypt(cipherText);
            System.out.println(decrypted);
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static String encrypt(String clearText) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        SecretKeySpec keySpec = new SecretKeySpec(theKey.getEncoded(), "AES");
        //ruleid: gcm-nonce-reuse
        byte[] theBadIV = BAD_IV.getBytes();

        GCMParameterSpec gcmParameterSpec = new GCMParameterSpec(GCM_TAG_LENGTH * 8, theBadIV);
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, gcmParameterSpec);

        byte[] cipherText = cipher.doFinal(clearText.getBytes());

        return Base64.getEncoder().encodeToString(cipherText);
    }

    public static String decrypt(String cipherText) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        SecretKeySpec keySpec = new SecretKeySpec(theKey.getEncoded(), "AES");

        //Hard to detect that theIV is indeed built from a hardcoded string
        //todoruleid: gcm-nonce-reuse
        GCMParameterSpec gcmParameterSpec = new GCMParameterSpec(GCM_TAG_LENGTH * 8, theIV);
        cipher.init(Cipher.DECRYPT_MODE, keySpec, gcmParameterSpec);

        byte[] decoded = Base64.getDecoder().decode(cipherText);
        byte[] decryptedText = cipher.doFinal(decoded);

        return new String(decryptedText);
    }

    public static void setKeys() throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
        keyGenerator.init(256);

        theIV = BAD_IV.getBytes();
    }

}
