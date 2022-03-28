class Test {
  def bad1() {
    // ruleid: insecure-random
    import scala.util.Random

    val result = Seq.fill(16)(Random.nextInt)
    return result.map("%02x" format _).mkString
  }

  def ok1() {
    // ok: insecure-random
    import java.security.SecureRandom

    val rand = new SecureRandom()
    val value = Array.ofDim[Byte](16)
    rand.nextBytes(value)
    return value.map("%02x" format _).mkString
  }
}
