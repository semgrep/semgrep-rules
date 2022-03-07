
// test code from https://pumascan.com/rules/#sec0106-sql-injection-dynamic-linq-query
class Foo{  
    public void Bad(object model){
        using (DbDataContext context = new DbDataContext())
        {
            string q = "SELECT Name from Items where ProductCode = " + model.ProductCode;
            // ruleid:sql-injection-dynamic-linq-query 
            name = context.ExecuteQuery<string>(q).SingleOrDefault().ToString();
        }
    }

    public void Good(object model){
        using (DbDataContext context = new DbDataContext())
        {
       
            string q = "SELECT Name from Items where ProductCode = {0}";
            // ok:sql-injection-dynamic-linq-query 
            name = context.ExecuteQuery<string>(q, model.ProductCode).SingleOrDefault().ToString();
        }
    }
}
            