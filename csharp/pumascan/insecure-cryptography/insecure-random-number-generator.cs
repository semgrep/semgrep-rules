// test code from https://pumascan.com/rules/#sec0115-insecure-random-number-generator
using Org.BouncyCastle.Crypto;

class Foo{  
public static byte[] GenerateRandomBytes(int length)
{
    // ruleid:insecure-random-number-generator 
    var random = new Random();
    byte[] bytes = new byte[length];
    random.NextBytes(bytes);
    return bytes;
}


public static byte[] GenerateSecureRandomBytes(int length)
{
    // ok:insecure-random-number-generator 
    var random = new RNGCryptoServiceProvider();
    byte[] bytes = new byte[length];
    random.GetNonZeroBytes(bytes);
    return bytes;
}

}
            