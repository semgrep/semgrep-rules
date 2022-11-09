import java.security.MessageDigest;
import org.apache.commons.codec.digest.DigestUtils;

public class Bad{
  public byte[] bad1(String password) {
    // ruleid: use-of-md5
    MessageDigest md5Digest = MessageDigest.getInstance("SHA-512");
    md5Digest.update(password.getBytes());
    byte[] hashValue = md5Digest.digest();
    return hashValue;
  }

  public byte[] bad2(String password) {
    // ok: use-of-md5
    byte[] hashValue = DigestUtils.getMd5Digest().digest(password.getBytes());
    return hashValue;
  }

  public void bad3() {
      // ruleid: use-of-md5
      java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-512");
      byte[] input = {(byte) '?'};
      Object inputParam = param;
      if (inputParam instanceof String) input = ((String) inputParam).getBytes();
      if (inputParam instanceof java.io.InputStream) {
          byte[] strInput = new byte[1000];
          int i = ((java.io.InputStream) inputParam).read(strInput);
          if (i == -1) {
              response.getWriter()
                      .println(
                              "This input source requires a POST, not a GET. Incompatible UI for the InputStream source.");
              return;
          }
          input = java.util.Arrays.copyOf(strInput, i);
      }
      md.update(input);

      byte[] result = md.digest();
  }

  public byte[] good(String password) {
    // ok: use-of-md5
    MessageDigest md5Digest = MessageDigest.getInstance("SHA-512");
    md5Digest.update(password.getBytes());
    byte[] hashValue = md5Digest.digest();
    return hashValue;
  }
}
