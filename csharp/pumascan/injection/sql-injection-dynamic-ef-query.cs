
// test code from https://pumascan.com/rules/#sec0108-sql-injection-dynamic-ef-query
class Foo{  

    public void BadQuery(object model){
        using (DbDataContext context = new DbDataContext())
        {
            string q = "DELETE FROM Items WHERE ProductCode = '" + model.ProductCode + "'";
            // ruleid:sql-injection-dynamic-ef-query 
            context.Database.ExecuteSqlCommand(q);
        }
    }
    public void GoodQuery(object model){
        using (DbDataContext context = new DbDataContext())
        {
            // ok:sql-injection-dynamic-ef-query 
            string q = "DELETE FROM Items WHERE ProductCode = @productCode";
            context.Database.ExecuteSqlCommand(q, model.ProductCode);
        }
    }
}
            