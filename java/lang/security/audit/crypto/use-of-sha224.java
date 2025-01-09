import java.security.MessageDigest;
import org.apache.commons.codec.digest.DigestUtils;
import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_224;

public class Bad {
  public byte[] bad1(String password) {
    // ruleid: use-of-sha224
    MessageDigest sha224Digest = MessageDigest.getInstance("SHA-224");
    sha224Digest.update(password.getBytes());
    byte[] hashValue = sha224Digest.digest();
    return hashValue;
  }

  public byte[] bad2(String password) {
    // ruleid: use-of-sha224
    byte[] hashValue = DigestUtils.getSha3_224Digest().digest(password.getBytes());
    return hashValue;
  }

  public void bad3() {
    // ruleid: use-of-sha224
    java.security.MessageDigest md = java.security.MessageDigest.getInstance("sha224", "SUN");
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

  public byte[] bad4(String password) {
    // ruleid: use-of-sha224
    byte [] hashValue = new DigestUtils(SHA_224).digest(password.getBytes());
    return hashValue;
  }
}
