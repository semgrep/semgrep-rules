
// test code from https://pumascan.com/rules/#sec0107-sql-injection-ado-net
class Foo{  
    public void BadSetup(object model){
        // ruleid:sql-injection-ado-net 
        SqlCommand cmd = new SqlCommand("select count(*) from Users where UserName = '" + model.UserName + "'", cn);
        string result = cmd.ExecuteScalar().ToString();
    }

    public void GoodSetup(object model){
        // ok:sql-injection-ado-net 
        SqlCommand cmd = new SqlCommand("select count(*) from Users where UserName = @UserName", cn);
        SqlParameter parm = new SqlParameter("@UserName", NVarChar);
        parm.Value = model.UserName;
        cmd.Parameters.Add(parm);
        string result = cmd.ExecuteScalar().ToString();
    }
}
            