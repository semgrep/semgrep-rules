# ruleid: ps-reflective-pe-loader-mimikatz
$assembly = [Reflection.Assembly]::Load([Convert]::FromBase64String($MimikatzB64))

# ruleid: ps-reflective-pe-loader-mimikatz
[System.Reflection.Assembly]::Load((New-Object IO.Compression.GZipStream([IO.MemoryStream][Convert]::FromBase64String($payload),[IO.Compression.CompressionMode]::Decompress)))

# ruleid: ps-reflective-pe-loader-mimikatz
$bytes = [Convert]::FromBase64String($MimikatzCompressed); $ds = New-Object IO.Compression.DeflateStream([IO.MemoryStream]$bytes, [IO.Compression.CompressionMode]::Decompress); [System.Reflection.Assembly]::Load($bytes)

# ok: ps-reflective-pe-loader-mimikatz
$zipStream = [System.IO.Compression.GZipStream]::new($fileStream, [System.IO.Compression.CompressionMode]::Compress); $zipStream.Write($fileBytes, 0, $fileBytes.Length); $zipStream.Close()

# ok: ps-reflective-pe-loader-mimikatz
Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::CreateFromDirectory($sourceDir, $destZip)
