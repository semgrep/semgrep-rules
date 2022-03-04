
// test code from https://pumascan.com/rules/#sec0024-unencoded-response-write
class Foo{      

    protected void Page_Load(object sender, EventArgs e){
    string user = Request["user"]?.ToString();
// ruleid:unencoded-response-write 
    Response.Write("We're sorry" + user + "but that contest is not valid.  Please click your back button and try again.");
    }

    protected void Page_Load_New(object sender, EventArgs e){
    string user = Request["user"]?.ToString();
    // ok:unencoded-response-write 
    Response.Write("We're sorry" + Encoder.HtmlEncode(user) + "but that contest is not valid.  Please click your back button and try again.");
    }
}
            