import java.security.MessageDigest
import org.apache.commons.codec.digest.DigestUtils

public class WeakHashes {
  public fun sha1(password: String): Array<Byte> {
      // ruleid: use-of-sha1
      var sha1Digest: MessageDigest = MessageDigest.getInstance("SHA1")
      sha1Digest.update(password.getBytes())
      val hashValue: Array<Byte> = sha1Digest.digest()
      return hashValue
  }
  public fun sha1b(password: String): Array<Byte> {
      // ruleid: use-of-sha1
      var sha1Digest: MessageDigest = MessageDigest.getInstance("SHA-1")
      sha1Digest.update(password.getBytes())
      val hashValue: Array<Byte> = sha1Digest.digest()
      return hashValue
  }
  public fun sha1_digestutil(password: String): Array<Byte> {
    // ruleid: use-of-sha1
    val hashValue: Array<Byte> = DigestUtils.getSha1Digest().digest(password.getBytes())
    return hashValue
  }
}
