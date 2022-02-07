import java.time.Clock
import pdi.jwt.{JwtJson, JwtAlgorithm}
import play.api.libs.json.Json

class FooBar {
  private val JWT_KEY = "foobar"

  def something(name: String) = {
    val claim = Json.obj(("user", 1), ("nbf", 1431520421))
    val key1 = "secretKey"
    val algo = JwtAlgorithm.HS256
    JwtJson.encode(claim)
    val token = JwtJson.encode(claim, key1, algo)
    JwtJson.decodeJson(token, key, Seq(JwtAlgorithm.HS256))
  }

  def something2(name: String) = {
    val claim = Json.obj(("user", 1), ("nbf", 1431520421))
    val key2 = getSecretFromEnv()
    val algo = JwtAlgorithm.HS256
    JwtJson.encode(claim)
    val token = JwtJson.encode(claim, key2, algo)
    JwtJson.decodeJson(token, key, Seq(JwtAlgorithm.HS256))
  }

  def something3(name: String) = {
    val claim = Json.obj(("user", 1), ("nbf", 1431520421))
    val key2 = getSecretFromEnv()
    val algo = JwtAlgorithm.HS256
    JwtJson.encode(claim)
    val token = JwtJson.encode(claim, this.JWT_KEY, algo)
    JwtJson.decodeJson(token, key, Seq(JwtAlgorithm.HS256))
  }
}