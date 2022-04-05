import slick.jdbc.H2Profile.api._

class FooBar {
  def something(name: String) = {
    val db = Database.forConfig("h2mem1")

    // ruleid: scala-slick-sql-non-literal
    val action = sql"select ID, NAME, AGE from #$name".as[(Int,String,Int)]
    db.run(action)

    // ok: scala-slick-sql-non-literal
    val action2 = sql"select ID, NAME, AGE from $name".as[(Int,String,Int)]
    db.run(action2)
  }
}