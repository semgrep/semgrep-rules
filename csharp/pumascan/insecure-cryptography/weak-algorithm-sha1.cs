
// test code from https://pumascan.com/rules/#sec0028-weak-algorithm-sha1
class Foo{  
    // ruleid:weak-algorithm-sha1 
HashAlgorithm hash = new SHA1CryptoServiceProvider();
byte[] bytes = hash.ComputeHash(input);


    // ok:weak-algorithm-sha1 
HashAlgorithm hash = new SHA512Managed();
byte[] bytes = hash.ComputeHash(input);

}
            