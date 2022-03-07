
// test code from https://pumascan.com/rules/#sec0026-weak-cipher-mode
class Foo{  
    using (MemoryStream mStream = new MemoryStream())
{

    //Input bytes
    byte[] inputBytes = Encoding.UTF8.GetBytes(plainText);

    SymmetricAlgorithm alg = Aes.Create();
    // ruleid:weak-cipher-mode 
    alg.Mode = CipherMode.ECB;

    //Set key and iv
    alg.Key = GetKey();
    alg.IV = GetIv();

    //Create the crypto stream
    CryptoStream cStream = new CryptoStream(mStream
      , alg.CreateEncryptor()
      , CryptoStreamMode.Write);
    cStream.Write(inputBytes, 0, inputBytes.Length);
    cStream.FlushFinalBlock();
    cStream.Close();

    //Get the output
    output = mStream.ToArray();

    //Close resources
    mStream.Close();
    alg.Clear();
}


   
//Perform integrity check on incoming data
string[] args = model.ProtectedData.Split('.');
byte[] ciphertext = Convert.FromBase64String(args[0]);
byte[] hmac = Convert.FromBase64String(args[1]);

HMACSHA256 hmac = new HMACSHA256(_KEY);
byte[] verification = hmac.ComputeHash(ciphertext);

if (!verification.SequenceEqual(hmac))
    throw new ArgumentException("Invalid signature detected.");

using (MemoryStream mStream = new MemoryStream())
{
    SymmetricAlgorithm alg = Aes.Create();
     // ok:weak-cipher-mode 
    alg.Mode = CipherMode.CBC;

    //Set key and iv
    alg.Key = GetKey();
    alg.IV = GetIv();

    //Create the crypto stream
    CryptoStream cStream = new CryptoStream(mStream
      , alg.CreateDecryptor()
      , CryptoStreamMode.Write);
    cStream.Write(ciphertext, 0, inputBytes.Length);
    cStream.FlushFinalBlock();
    cStream.Close();

    //Get the cleartext
    byte[] cleartext = mStream.ToArray();

    //Close resources
    mStream.Close();
    alg.Clear();
}

}
            