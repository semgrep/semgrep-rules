
// test code from https://pumascan.com/rules/#sec0027-weak-algorithm-md5
class Foo{  
    // ruleid:weak-algorithm-md5 
    HashAlgorithm hash = new MD5CryptoServiceProvider();
    byte[] bytes = hash.ComputeHash(input);


    // ok:weak-algorithm-md5 
    HashAlgorithm hash = new SHA512Managed();
    byte[] bytes = hash.ComputeHash(input);

}
            