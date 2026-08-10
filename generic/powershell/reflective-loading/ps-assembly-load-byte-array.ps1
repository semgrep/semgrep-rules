$assemblyBytes = [Convert]::FromBase64String($base64Payload)
# ruleid: ps-assembly-load-byte-array
[System.Reflection.Assembly]::Load($assemblyBytes)

# ruleid: ps-assembly-load-byte-array
[Reflection.Assembly]::Load($shellcodeBytes)

$decompressed = (New-Object System.IO.StreamReader((New-Object System.IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String($b64), [IO.Compression.CompressionMode]::Decompress)), [System.Text.Encoding]::ASCII)).ReadToEnd()
# ruleid: ps-assembly-load-byte-array
[System.Reflection.Assembly]::Load([Convert]::FromBase64String($decompressed))

# ok: ps-assembly-load-byte-array
Add-Type -AssemblyName 'System.Web'
[System.Web.HttpUtility]::UrlEncode($url)

# ok: ps-assembly-load-byte-array
$assembly = [System.Reflection.Assembly]::GetExecutingAssembly()
Write-Host $assembly.FullName
