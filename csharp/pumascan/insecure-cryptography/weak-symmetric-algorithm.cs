
// test code from https://pumascan.com/rules/#sec0025-weak-symmetric-algorithm
class Foo{  
    using (MemoryStream mStream = new MemoryStream())
{
    //Input bytes
    byte[] inputBytes = Encoding.UTF8.GetBytes(plainText);

// ruleid:weak-symmetric-algorithm 
    SymmetricAlgorithm alg = new DESCryptoServiceProvider();

    //Set key and iv
    alg.Key = GetKey();
    alg.IV = GetIv();

    //Create the crypto stream
    CryptoStream cStream = new CryptoStream(mStream, alg.CreateEncryptor(), CryptoStreamMode.Write);
    cStream.Write(inputBytes, 0, inputBytes.Length);
    cStream.FlushFinalBlock();
    cStream.Close();

    //Get the output
    output = mStream.ToArray();

    //Close resources
    mStream.Close();
    alg.Clear();
}


    using (MemoryStream mStream = new MemoryStream())
{
    //Input bytes
    byte[] inputBytes = Encoding.UTF8.GetBytes(plainText);

// ok:weak-symmetric-algorithm 
    SymmetricAlgorithm alg = new AesManaged();

    //Set key and iv
    alg.Key = GetKey();
    alg.IV = GetIv();

    //Create the crypto stream
    CryptoStream cStream = new CryptoStream(mStream, alg.CreateEncryptor(), CryptoStreamMode.Write);
    cStream.Write(inputBytes, 0, inputBytes.Length);
    cStream.FlushFinalBlock();
    cStream.Close();

    //Get the output
    output = mStream.ToArray();

    //Close resources
    mStream.Close();
    alg.Clear();
}

}
            