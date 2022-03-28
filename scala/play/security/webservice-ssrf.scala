package controllers

import javax.inject._
import play.api._
import play.api.mvc._
import play.api.libs.ws._
import scala.concurrent.Future
import scala.util.Success
import scala.util.Failure
import scala.concurrent.ExecutionContext

object Smth {
  def call1(wsClient: WSClient, url: String): Future[Unit] = {
    // ruleid: webservice-ssrf
    wsClient.url(url).get().map { response =>
      val statusText: String = response.statusText
      println(s"Got a response $statusText")
    }
  }

  def call2(wsClient: WSClient): Future[Unit] = {
    // ok: webservice-ssrf
    wsClient.url("https://www.google.com").get().map { response =>
      val statusText: String = response.statusText
      println(s"Got a response $statusText")
    }
  }
}

object FooBar {
  def call1(url: String): Future[Unit] = {
    val wsClient = AhcWSClient()
    // ruleid: webservice-ssrf
    wsClient.url(url).get().map { response =>
      val statusText: String = response.statusText
      println(s"Got a response $statusText")
    }
  }

  def call2(): Future[Unit] = {
    val wsClient = AhcWSClient()
    // ok: webservice-ssrf
    wsClient.url("https://www.google.com").get().map { response =>
      val statusText: String = response.statusText
      println(s"Got a response $statusText")
    }
  }
}

@Singleton
class HomeController @Inject()(
  ws: WSClient,
  val controllerComponents: ControllerComponents,
  implicit val ec: ExecutionContext
) extends BaseController {

  def req1(url: String) = Action.async { implicit request: Request[AnyContent] =>
    // ruleid: webservice-ssrf
    val futureResponse = ws.url(url).get()
    futureResponse.map { response =>
      Ok(s"it works: ${response.statusText}")
    }
  }

  def req2(url: String) = Action.async { implicit request: Request[AnyContent] =>
    // ok: webservice-ssrf
    val futureResponse = ws.url("https://www.google.com").get()
    futureResponse.map { response =>
      Ok(s"it works: ${url}")
    }
  }

}
