package controllers

import javax.inject._
import play.api._
import play.api.mvc._
import scalaj.http.{Http, Token}

object Smth {
  def call1(url: String): Future[Unit] = {
    // ruleid: scalaj-http-ssrf
    val response: HttpResponse[String] = Http(url).param("q","monkeys").asString
    response.body
  }

  def call2(): Future[Unit] = {
    // ok: scalaj-http-ssrf
    val response: HttpResponse[String] = Http("https://www.google.com").param("q","monkeys").asString
    response.body
  }
}

object FooBar {
  def call1(url: String): Future[Unit] = {
    // ruleid: scalaj-http-ssrf
    val request = Http(url).postForm(Seq("name" -> "jon", "age" -> "29"))
    request.asString
  }

  def call2(): Future[Unit] = {
    // ok: scalaj-http-ssrf
    val request = Http("https://www.google.com").postForm(Seq("name" -> "jon", "age" -> "29"))
    request.asString
  }
}

@Singleton
class HomeController @Inject()(
  val controllerComponents: ControllerComponents,
  implicit val ec: ExecutionContext
) extends BaseController {

  def req1(url: String) = Action.async { implicit request: Request[AnyContent] =>
    val consumer = Token("key", "secret")
    // ruleid: scalaj-http-ssrf
    val response = Http(url).postForm(Seq("oauth_callback" -> "oob")).oauth(consumer).asToken
    Ok(response.body.key)
  }

  def req2() = Action.async { implicit request: Request[AnyContent] =>
    val consumer = Token("key", "secret")
    // ok: scalaj-http-ssrf
    val response = Http("https://www.google.com").postForm(Seq("oauth_callback" -> "oob")).oauth(consumer).asToken
    Ok(response.body.key)
  }

}
