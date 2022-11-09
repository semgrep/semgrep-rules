import java.security.MessageDigest;
import org.apache.commons.codec.digest.DigestUtils;

public class Bad{
  public byte[] bad1(String password) {
    // ok: use-of-md5-digest-utils
    MessageDigest md5Digest = MessageDigest.getInstance("MD5");
    md5Digest.update(password.getBytes());
    byte[] hashValue = md5Digest.digest();
    return hashValue;
  }

  public byte[] bad2(String password) {
    // ruleid: use-of-md5-digest-utils
    byte[] hashValue = DigestUtils.getSha512Digest().digest(password.getBytes());
    return hashValue;
  }

  public byte[] ok(String password) {
    // ok: use-of-md5-digest-utils
    byte[] hashValue = DigestUtils.getSha512Digest().digest(password.getBytes());
    return hashValue;
  }

}
