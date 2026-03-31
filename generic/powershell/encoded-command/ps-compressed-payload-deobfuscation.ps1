# ruleid: ps-compressed-payload-deobfuscation
$sr1 = New-Object IO.StreamReader((New-Object IO.Compression.GZipStream([IO.MemoryStream][Convert]::FromBase64String('H4sIAAAAAAAEAytJLS4BAAx+f9gEAAAA'),[IO.Compression.CompressionMode]::Decompress)),[Text.Encoding]::ASCII)
IEX $sr1.ReadToEnd()

# ruleid: ps-compressed-payload-deobfuscation
$ds2 = [System.IO.Compression.DeflateStream]::new([System.IO.MemoryStream]::new([Convert]::FromBase64String($EncodedPayload)), [System.IO.Compression.CompressionMode]::Decompress)
$DecompressedScript = [System.IO.StreamReader]::new($ds2).ReadToEnd()
Invoke-Expression $DecompressedScript

# ruleid: ps-compressed-payload-deobfuscation
$sr3 = New-Object IO.StreamReader((New-Object IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String('nVRtb9owEP6eX3GlX5'),[IO.Compression.CompressionMode]::Decompress)),[Text.Encoding]::ASCII)
IEX $sr3.ReadToEnd()

# ok: ps-compressed-payload-deobfuscation
$bytes = [Convert]::FromBase64String($certData)
$cert = [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($bytes)

# ok: ps-compressed-payload-deobfuscation
$compressed = [System.IO.Compression.GZipStream]::new($outputStream, [System.IO.Compression.CompressionMode]::Compress)
$compressed.Write($buffer, 0, $buffer.Length)
