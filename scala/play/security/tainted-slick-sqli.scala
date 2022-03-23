package controllers

import play.api.mvc._
import javax.inject._
import slick.jdbc.H2Profile.api._
import models.UserModel

@Singleton
class HomeController @Inject()(val controllerComponents: ControllerComponents) extends BaseController{
  val db = Database.forConfig("h2mem1")

  def oneAction() = Action { implicit request: Request[AnyContent] =>
    val bodyVals = request.body.asFormUrlEncoded
    val smth = bodyVals.get("username").head
    // ruleid: tainted-slick-sqli
    val action = sql"select ID, NAME, AGE from #$smth".as[(Int,String,Int)]
    db.run(action)
    Ok("ok")
  }

  def twoAction(name: String) = Action {
    val people = TableQuery[People]

    // ruleid: tainted-slick-sqli
    people.map(p => (p.id,p.name,p.age)).result.overrideSql(s"SELECT id, name, age FROM Person WHERE $name")

    Ok("ok")
  }

  def threeAction(name: String) = Action.async(parse.json) {
    val people = TableQuery[People]

    // ruleid: tainted-slick-sqli
    people.map(p => (p.id,p.name,p.age)).result.overrideSql(s"SELECT id, name, age FROM Person WHERE $name")

    Ok("ok")
  }

  def helloWorldPage() = Action { implicit request: Request[AnyContent] =>
    // ok: tainted-slick-sqli
    Ok(views.html.helloWorld())
  }

  def okAction1() = Action { implicit request: Request[AnyContent] =>
    val smth = "hardcoded_value"
    // ok: tainted-slick-sqli
    val action = sql"select ID, NAME, AGE from #$smth".as[(Int,String,Int)]
    db.run(action)
    Ok("ok")
  }

  def okAction2(name: String) = Action { implicit request: Request[AnyContent] =>
    val people = TableQuery[People]

    people.map(p => (p.id,p.name,p.age))
      .result
      // ok: tainted-slick-sqli
      .overrideSql(s"SELECT id, name, age FROM Person WHERE name = 'FooBar'")

    Ok("ok")
  }

}