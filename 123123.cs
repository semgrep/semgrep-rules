using System.Security.Cryptography;

private static void EncryptData(String inName, String outName, byte[] desKey, byte[] desIV)
 {
     //Create the file streams to handle the input and output files.
     FileStream fin = new FileStream(inName, FileMode.Open, FileAccess.Read);
     FileStream fout = new FileStream(outName, FileMode.OpenOrCreate, FileAccess.Write);
     fout.SetLength(0);

     //Create variables to help with read and write.
     byte[] bin = new byte[100]; //This is intermediate storage for the encryption.
     long rdlen = 0;              //This is the total number of bytes written.
     long totlen = fin.Length;    //This is the total length of the input file.
     int len;                     //This is the number of bytes to be written at a time.

     DES des = new DESCryptoServiceProvider();
     TripleDESCryptoServiceProvider tDESalg = new TripleDESCryptoServiceProvider();
     TripleDESCryptoServiceProvider tDESalg1 = new TripleDESCryptoServiceProvider();
     CryptoStream encStream = new CryptoStream(fout, des.CreateEncryptor(desKey, desIV), CryptoStreamMode.Write);

     Console.WriteLine("Encrypting...");

     //Read from the input file, then encrypt and write to the output file.
     while(rdlen < totlen)
     {
         len = fin.Read(bin, 0, 100);
         encStream.Write(bin, 0, len);
         rdlen = rdlen + len;
         Console.WriteLine("{0} bytes processed", rdlen);
     }

     encStream.Close();
     fout.Close();
     fin.Close();
 }

 using (DESCryptoServiceProvider des = new()) 
{
}

using (DESCryptoServiceProvider des = new())   
{
}

using (RC2CryptoServiceProvider rc21 = new())   
{
}

using (AesCryptoServiceProvider aes = new())   
{
}