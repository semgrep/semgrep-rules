
// test code from https://pumascan.com/rules/#sec0104-unencoded-webforms-property
public partial class Foo : System.Web.UI.Page {  

    protected void Page_Load(object sender, EventArgs e){
        product = GetProduct(e.someArg);
        // ruleid:unencoded-webforms-property-codebehind   
        litDetails.Text = product.ProductDescription;
    }

    protected void Page_Load(object sender, EventArgs e){
        product = GetProduct(e.someArg);    
        // ok:unencoded-webforms-property-codebehind
        litDetails.Text = Encoder.HtmlEncode(product.ProductDescription);
    }
}
            