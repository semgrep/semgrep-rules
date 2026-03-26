# ruleid: ps-compressed-payload-deobfuscation
IEX(New-Object IO.StreamReader((New-Object IO.Compression.GZipStream([IO.MemoryStream][Convert]::FromBase64String('H4sIAAAAAAAEAytJLS4BAAx+f9gEAAAA'),[IO.Compression.CompressionMode]::Decompress)),[Text.Encoding]::ASCII)).ReadToEnd()

# ruleid: ps-compressed-payload-deobfuscation
$DecompressedScript = [System.IO.StreamReader]::new([System.IO.Compression.DeflateStream]::new([System.IO.MemoryStream]::new([Convert]::FromBase64String($EncodedPayload)), [System.IO.Compression.CompressionMode]::Decompress)).ReadToEnd()
Invoke-Expression $DecompressedScript

# ruleid: ps-compressed-payload-deobfuscation
IEX(New-Object IO.StreamReader((New-Object IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String('nVRtb9owEP6eX3GlX5'),[IO.Compression.CompressionMode]::Decompress)),[Text.Encoding]::ASCII)).ReadToEnd()

# ok: ps-compressed-payload-deobfuscation
$bytes = [Convert]::FromBase64String($certData)
$cert = [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($bytes)

# ok: ps-compressed-payload-deobfuscation
$compressed = [System.IO.Compression.GZipStream]::new($outputStream, [System.IO.Compression.CompressionMode]::Compress)
$compressed.Write($buffer, 0, $buffer.Length)
