package testcode.crypto

import java.io.UnsupportedEncodingException
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

public class BadHexa {
    public fun main(args: Array<String>): Void {
        val good: String = goodHash("12345")
        val bad: String = badHash("12345")
        System.out.println(String.format("%s (len=%d) != %s (len=%d)", good, good.length(), bad, bad.length()))
    }

    // ok: bad-hexa-conversion
    public fun goodHash(password: String): String {
        val md: MessageDigest = MessageDigest.getInstance("SHA-1")
        val resultBytes: Array<Byte> = md.digest(password.getBytes("UTF-8"))

        var stringBuilder: StringBuilder = StringBuilder()
        for (b in resultBytes) {
            stringBuilder.append(String.format("%02X", b))
        }

        return stringBuilder.toString()
    }

    // ruleid: bad-hexa-conversion
    public fun badHash(password: String): String {
        val md: MessageDigest = MessageDigest.getInstance("SHA-1")
        val resultBytes: Array<Byte> = md.digest(password.getBytes("UTF-8"))

        var stringBuilder: StringBuilder = StringBuilder()
        for (b in resultBytes) {
            stringBuilder.append(Integer.toHexString(b and 0xFF))
        }

        return stringBuilder.toString()
    }
}
