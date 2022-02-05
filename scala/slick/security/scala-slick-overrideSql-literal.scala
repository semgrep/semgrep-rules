import slick.jdbc.H2Profile.api._

class FooBar {
  def something(name: String) = {
    val db = Database.forConfig("h2mem1")

    lazy val people = TableQuery[People]

    // ok: scala-slick-overrideSql-literal
    people.map(p => (p.id,p.name,p.age))
      .result
      .overrideSql("SELECT id, name, age FROM Person")
    
    val query = "SELECT id, name, age FROM Person"
    // ok: scala-slick-overrideSql-literal
    people.map(p => (p.id,p.name,p.age))
      .result
      .overrideSql(query)


    // ruleid: scala-slick-overrideSql-literal
    people.map(p => (p.id,p.name,p.age))
      .result
      .overrideSql(s"SELECT id, name, age FROM Person WHERE $name")
  }
}