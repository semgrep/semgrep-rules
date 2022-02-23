using System.IdentityModel.Tokens;

namespace System.IdentityModel.Samples
{
    public class TrustedIssuerNameRegistry : IssuerNameRegistry
    {
        public override string GetIssuerName(SecurityToken securityToken)
        {
            X509SecurityToken x509Token = securityToken as X509SecurityToken;
            if (x509Token != null)
            {
                // ruleid: X509-subject-name-validation
                if (String.Equals(x509Token.Certificate.SubjectName.Name, "CN=localhost"))
                {
                    return x509Token.Certificate.SubjectName.Name;
                }

                // ruleid: X509-subject-name-validation
                if (String.Equals("CN=localhost", x509Token.Certificate.SubjectName.Name))
                {
                    return x509Token.Certificate.SubjectName.Name;
                }
            }

            // ok
            if(String.Equals("Hello", "Goodbye")) { }
        }

        public override string GetIssuerName2() // no args
        {
            X509SecurityToken x509Token = new X509SecurityToken();
            if (x509Token != null)
            {
                // ruleid: X509-subject-name-validation
                if (x509Token.Certificate.SubjectName.Name.Equals("CN=localhost"))
                {
                    return x509Token.Certificate.SubjectName.Name;
                }
            }
        }

        public override string GetIssuerName3()
        {
            X509SecurityToken x509Token = new X509SecurityToken();
            if (x509Token != null)
            {
                // ruleid: X509-subject-name-validation
                if ("CN=localhost" == x509Token.Certificate.SubjectName.Name)
                {
                    return x509Token.Certificate.SubjectName.Name;
                }

                // ruleid: X509-subject-name-validation
                if (x509Token.Certificate.SubjectName.Name == "CN=localhost")
                {
                    return x509Token.Certificate.SubjectName.Name;
                }
            }
        }

        public override string GetIssuerNameLoop()
        {
            X509Store store = new X509Store("MY",StoreLocation.CurrentUser);
            store.Open(OpenFlags.ReadOnly | OpenFlags.OpenExistingOnly);

            X509Certificate2Collection collection = (X509Certificate2Collection)store.Certificates;
            X509Certificate2Collection fcollection = (X509Certificate2Collection)collection.Find(X509FindType.FindByTimeValid,DateTime.Now,false);
            X509Certificate2Collection scollection = X509Certificate2UI.SelectFromCollection(fcollection, "Test Certificate Select","Select a certificate from the following list to get information on that certificate",X509SelectionFlag.MultiSelection);

            foreach (X509Certificate2 x509 in scollection)
            {
                // ruleid: X509-subject-name-validation
                String.Equals(x509.GetNameInfo(X509NameType.SimpleName), "CN=localhost");

                // ruleid: X509-subject-name-validation
                if(x509.SubjectName.Name == "CN=localhost") { }
            }
            store.Close();
        }
    }
}
