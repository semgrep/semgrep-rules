import javax.crypto.Cipher
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey
import javax.crypto.spec.GCMParameterSpec
import javax.crypto.spec.SecretKeySpec
import java.util.Base64

public class GcmHardcodedIV
{
    fun byteArrayOfInts(vararg ints: Int) = Array<Byte>(ints.size) { pos -> ints[pos].toByte() }
    public final val GCM_TAG_LENGTH: Int = 16
    public final val BAD_IV: String = "ab0123456789"
    public final val BAD_IV2 = byteArrayOfInts(0,1,2,3,4,5,6,7,8,9,10,11)

    private val theIV: Array<Byte>
    private val theKey: SecretKey

    public fun main(args: Array<String>) : Void
    {
        val clearText: String = args[0]
        System.out.println(clearText)

        try {
            setKeys()

            val cipherText: String = encrypt(clearText)
            System.out.println(cipherText)

            val decrypted: String = decrypt(cipherText)
            System.out.println(decrypted)
        } catch(e: Exception) {
            System.out.println(e.getMessage())
        }
    }

    public fun encrypt(clearText: String): String {
        // ruleid:gcm-detection
        val cipher: Cipher = Cipher.getInstance("AES/GCM/NoPadding")
        val keySpec: SecretKeySpec= SecretKeySpec(theKey.getEncoded(), "AES")
        val theBadIV: Array<Byte> = BAD_IV.getBytes()

        // ruleid:gcm-detection
        val gcmParameterSpec: GCMParameterSpec = GCMParameterSpec(GCM_TAG_LENGTH * 8, theBadIV)
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, gcmParameterSpec)

        val cipherText: Array<Byte> = cipher.doFinal(clearText.getBytes())

        val encoded = base64.getEncoder().encodeToString(cipherText)
        return encoded
    }

    public fun decrypt(cipherText: String): String {
        // ruleid:gcm-detection
        val cipher: Cipher = Cipher.getInstance("AES/GCM/NoPadding")
        val keySpec: SecretKeySpec = SecretKeySpec(theKey.getEncoded(), "AES")

        // ruleid:gcm-detection
        val gcmParameterSpec: GCMParameterSpec = GCMParameterSpec(GCM_TAG_LENGTH * 8, theIV)
        cipher.init(Cipher.DECRYPT_MODE, keySpec, gcmParameterSpec)

        val decoded: Array<Byte> = Base64.getDecoder().decode(cipherText)
        val decryptedText: Array<Byte> = cipher.doFinal(decoded)

        return String(decryptedText)
    }

    public fun setKeys(): Void {
        val keyGenerator: KeyGenerator = KeyGenerator.getInstance("AES")
        keyGenerator.init(256)

        theIV = BAD_IV.getBytes()
    }

}
