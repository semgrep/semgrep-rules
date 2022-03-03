package controllers

import javax.inject._
import play.api._
import play.api.mvc._
import dispatch._
import Defaults._

object Smth {
  def call1(request_url: String): Future[Unit] = {
    // ruleid: dispatch-ssrf
    val req = url(request_url)
    val data = Http.default(req OK as.String)
    data
  }

  def call2(): Future[Unit] = {
    // ok: dispatch-ssrf
    val req = url("https://www.google.com")
    val data = Http.default(req OK as.String)
    data
  }
}

object FooBar {
  def call1(request_url: String): Future[Unit] = {
    // ruleid: dispatch-ssrf
    val request = url(request_url).POST.setHeader("Content-Type", "application/json")
    val res = Http(request OK as.String)
    res
  }

  def call2(): Future[Unit] = {
    // ok: dispatch-ssrf
    val request = url("https://www.google.com").POST.setHeader("Content-Type", "application/json")
    val res = Http(request OK as.String)
    res
  }
}

@Singleton
class HomeController @Inject()(
  val controllerComponents: ControllerComponents,
  implicit val ec: ExecutionContext
) extends BaseController {

  def req1(request_url: String) = Action.async { implicit request: Request[AnyContent] =>
    // ruleid: dispatch-ssrf
    val request = url(request_url).POST.setHeader("Content-Type", "application/json")
    val res = Http(request OK as.String)
    Ok("ok")
  }

  def req2() = Action.async { implicit request: Request[AnyContent] =>
    // ok: dispatch-ssrf
    val request = url("https://www.google.com").POST.setHeader("Content-Type", "application/json")
    val res = Http(request OK as.String)
    Ok("ok")
  }

}
