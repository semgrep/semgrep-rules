package controllers

import javax.inject._
import play.api._
import play.api.mvc._
import scala.io.{Codec, Source}

object Smth {
  def call1(request_url: String) = {
    // ruleid: io-source-ssrf
    val html = Source.fromURI(request_url)
    val data = html.mkString
    data
  }

  def call2() = {
    // ok: io-source-ssrf
    val html = Source.fromURI("https://www.google.com")
    val data = html.mkString
    data
  }
}

object FooBar {
  def call1(request_url: String, codec: Codec) = {
    // ruleid: io-source-ssrf
    val res = Source.fromURL(request_url)(codec).mkString
    res
  }

  def call2() = {
    // ok: io-source-ssrf
    val res = Source.fromURL("https://www.google.com")(codec).mkString
    res
  }
}

@Singleton
class HomeController @Inject()(
  val controllerComponents: ControllerComponents,
  implicit val ec: ExecutionContext
) extends BaseController {

  def req1(request_url: String) = Action.async { implicit request: Request[AnyContent] =>
    val codec = whatIsCodec()
    // ruleid: io-source-ssrf
    val res = Source.fromURL(request_url, codec).mkString
    Ok(res)
  }

  def req2() = Action.async { implicit request: Request[AnyContent] =>
    // ok: io-source-ssrf
    val res = Source.fromURL("https://www.google.com").mkString
    Ok(res)
  }

}
