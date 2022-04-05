import java.security.KeyPairGenerator

public class WeakRSA {

  fun rsaWeak(): Void {
    // ruleid: use-of-weak-rsa-key
    val keyGen: KeyPairGenerator = KeyPairGenerator.getInstance("RSA")
    keyGen.initialize(512)
  }

  fun rsaOK(): Void {
    // ok: use-of-weak-rsa-key
    val keyGen = KeyPairGenerator.getInstance("RSA");
    keyGen.initialize(2048);
  }
}
