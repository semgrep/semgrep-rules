
// test code from https://pumascan.com/rules/#sec0125-weak-rsa-key-length
class Foo{  
    // ruleid:weak-rsa-key-length 
RSACryptoServiceProvider alg = new RSACryptoServiceProvider(1024);


    // ok:weak-rsa-key-length 
RSACryptoServiceProvider alg = new RSACryptoServiceProvider(2048);

}
            