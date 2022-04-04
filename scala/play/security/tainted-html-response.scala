package controllers

import play.api._
import play.api.mvc.{Action, Controller}
import play.twirl.api.Html;

class XssController extends Controller {

  def vulnerable1(value: String) = Action { implicit request: Request[AnyContent] =>
    // ruleid: tainted-html-response
    Ok(s"Hello $value !").as("text/html")
  }

  def vulnerable2(value: String) = Action.async { implicit request: Request[AnyContent] =>
    // ruleid: tainted-html-response
    Ok("Hello " + value + " !").as("tExT/HtML")
  }

  def vulnerable3(value: String, contentType: String) = Action { implicit request: Request[AnyContent] =>
    val bodyVals = request.body.asFormUrlEncoded
    val smth = bodyVals.get("username").head
    // ruleid: tainted-html-response
    Ok(s"Hello $smth !").as(contentType)
  }

  def vulnerable4(value: String) = Action.async(parse.json) { implicit request: Request[AnyContent] =>
    // ruleid: tainted-html-response
    Ok("Hello " + value + " !").as(ContentTypes.HTML)
  }

  def vulnerable5(value: String) = Action(parse.json) {
    // ruleid: tainted-html-response
    Ok(s"Hello $value !").as(HTML)
  }

  def vulnerable6(value:String) = Action { implicit request: Request[AnyContent] =>
    // ruleid: tainted-html-response
    Ok(views.html.xssHtml.render(Html.apply("Hello "+value+" !")))
  }
  
  def vulnerable7(value:String) = Action {
    // ruleid: tainted-html-response
    Ok(views.html.xssHtml.render(Html.apply("Hello "+value+" !")))
  }

  def safeJson(value: String) = Action.async { implicit request: Request[AnyContent] =>
    // ok: tainted-html-response
    Ok("Hello " + value + " !").as("text/json")
  }

  def safeTemplate(value:String) = Action {
    // ok: tainted-html-response
    Ok(views.html.template.render(value))
  }

  def variousSafe(value: String) = Action { implicit request: Request[AnyContent] =>
    // ok: tainted-html-response
    Ok("Hello "+value+" !")
    // ok: tainted-html-response
    Ok(s"Hello $value !").as("text/json")
    // ok: tainted-html-response
    Ok("<b>Hello !</b>").as("text/html")
    // ok: tainted-html-response
    Ok(views.html.xssHtml.render(Html.apply("<b>Hello !</b>")))

    val escapedValue = org.apache.commons.lang3.StringEscapeUtils.escapeHtml4(value)
    // ok: tainted-html-response
    Ok("Hello " + escapedValue + " !")
    // ok: tainted-html-response
    Ok("Hello " + escapedValue + " !").as("text/html")

    val owaspEscapedValue = org.owasp.encoder.Encode.forHtml(value)
    // ok: tainted-html-response
    Ok("Hello " + owaspEscapedValue + " !")
    // ok: tainted-html-response
    Ok("Hello " + owaspEscapedValue + " !").as("text/html")
  }
}
