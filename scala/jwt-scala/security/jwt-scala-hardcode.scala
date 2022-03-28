import java.time.Clock
import pdi.jwt.{JwtJson, JwtAlgorithm, JwtArgonaut, JwtCirce}
import play.api.libs.json.Json

object Smth {
  val secretKey = "foobar"

  def run1(token: String) = {
    val algo = JwtAlgorithm.HS256
    // ruleid: jwt-scala-hardcode
    JwtArgonaut.decodeJson(token, secretKey, algo)
  }

  def run2(token: String) = {
    val algo = JwtAlgorithm.HS256
    // ok: jwt-scala-hardcode
    JwtArgonaut.decodeJson(token, getSecretFromEnv(), algo)
  }
}

class FooBar {
  private val JWT_KEY = "foobar"

  def run1() = {
    val claim = Json.obj(("user", 1), ("nbf", 1431520421))
    val key1 = "secretKey"
    val algo = JwtAlgorithm.HS256
    // ruleid: jwt-scala-hardcode
    val token = JwtJson.encode(claim, key1, algo)
    // ok: jwt-scala-hardcode
    JwtJson.decodeJson(token, keyFromEnv, Seq(JwtAlgorithm.HS256))
  }

  def run2() = {
    val claim = Json.obj(("user", 1), ("nbf", 1431520421))
    val key2 = getSecretFromEnv()
    val algo = JwtAlgorithm.HS256
    // ruleid: jwt-scala-hardcode
    val token = JwtCirce.encode(claim, this.JWT_KEY, algo)
    // ruleid: jwt-scala-hardcode
    JwtCirce.decodeJson(token, this.JWT_KEY, Seq(JwtAlgorithm.HS256))
  }

  def run3() = {
    val claim = Json.obj(("user", 1), ("nbf", 1431520421))
    val key2 = getSecretFromEnv()
    val algo = JwtAlgorithm.HS256
    // ok: jwt-scala-hardcode
    val token = JwtJson.encode(claim, key2, algo)
    // ok: jwt-scala-hardcode
    JwtJson.decodeJson(token, key2, Seq(JwtAlgorithm.HS256))
  }
}