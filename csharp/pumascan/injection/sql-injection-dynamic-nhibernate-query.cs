
// test code from https://pumascan.com/rules/#sec0126-sql-injection-dynamic-nhibernate-query
class Foo{  
  public void BadQuery(object model){
    string q = "SELECT * FROM Items WHERE ProductCode = '" + model.ProductCode + "'";
    var cfg = new Configuration();
    ISessionFactory sessions = cfg.BuildSessionFactory();
    ISession session = sessions.OpenSession();
    // ruleid:sql-injection-dynamic-nhibernate-query 
    var query = session.CreateQuery(q);
    var product = query.List<Product>().FirstOrDefault();
  }
  public void GoodQuery(object model){
    string q = "SELECT * FROM Items WHERE ProductCode = :productCode";

    var cfg = new Configuration();
    ISessionFactory sessions = cfg.BuildSessionFactory();
    ISession session = sessions.OpenSession();

    // ok:sql-injection-dynamic-nhibernate-query 
    var query = session.CreateQuery(q);
    var product = query
      .SetString("productCode", model.ProductCode)
      .List<Product>().FirstOrDefault();
  }
}
            