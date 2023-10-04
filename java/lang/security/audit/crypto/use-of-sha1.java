import java.security.MessageDigest;
import org.apache.commons.codec.digest.DigestUtils;

public class Bad {
  public byte[] bad1(String password) {
    // ruleid: use-of-sha1
    MessageDigest sha1Digest = MessageDigest.getInstance("SHA-1");
    sha1Digest.update(password.getBytes());
    byte[] hashValue = sha1Digest.digest();
    return hashValue;
  }

  public byte[] bad2(String password) {
    // ruleid: use-of-sha1
    byte[] hashValue = DigestUtils.getSha1Digest().digest(password.getBytes());
    return hashValue;
  }

  public void bad3() {
    // ruleid: use-of-sha1
    java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA1", "SUN");
    byte[] input = { (byte) '?' };
    Object inputParam = bar;
    if (inputParam instanceof String)
      input = ((String) inputParam).getBytes();
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
    java.io.File fileTarget = new java.io.File(
        new java.io.File(org.owasp.benchmark.helpers.Utils.TESTFILES_DIR),
        "passwordFile.txt");
    java.io.FileWriter fw = new java.io.FileWriter(fileTarget, true); // the true will append the new data
    fw.write(
        "hash_value="
            + org.owasp.esapi.ESAPI.encoder().encodeForBase64(result, true)
            + "\n");
    fw.close();
  }
}
