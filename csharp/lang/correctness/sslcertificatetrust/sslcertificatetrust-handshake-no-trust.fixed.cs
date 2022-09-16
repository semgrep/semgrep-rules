public class Foo{
    private void SomeFunction(string arg1){
        //ruleid: correctness-sslcertificatetrust-handshake-no-trust
        var collection = SslCertificateTrust.CreateForX509Collection(certCollection,false);
    }

    private void SomeFunction2(string arg1){
        //ruleid: correctness-sslcertificatetrust-handshake-no-trust
        var collection = SslCertificateTrust.CreateForX509Collection(certCollection,false);
    }

    private void SomeFunction3(string arg1){
        //ok: correctness-sslcertificatetrust-handshake-no-trust
        var collection = SslCertificateTrust.CreateForX509Collection(certCollection);
    }

    private void SomeFunction4(string arg1){
        //ruleid: correctness-sslcertificatetrust-handshake-no-trust
        var collection = SslCertificateTrust.CreateForX509Store(certCollection,false);
    }

    private void SomeFunction5(string arg1){
        //ruleid: correctness-sslcertificatetrust-handshake-no-trust
        var collection = SslCertificateTrust.CreateForX509Store(certCollection,false);
    }

    private void SomeFunction6(string arg1){
        //ok: correctness-sslcertificatetrust-handshake-no-trust
        var collection = SslCertificateTrust.CreateForX509Store(certCollection);
    }
}
