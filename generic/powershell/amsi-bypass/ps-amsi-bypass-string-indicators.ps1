# ruleid: ps-amsi-bypass-string-indicators
$AmsiUtils = [System.Management.Automation.AmsiUtils]
# ruleid: ps-amsi-bypass-string-indicators
$AmsiUtils::amsiContext = [IntPtr]::Zero

# ruleid: ps-amsi-bypass-string-indicators
$field = 'amsiInitFailed'
# ruleid: ps-amsi-bypass-string-indicators
[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField($field,'NonPublic,Static').SetValue($null,$true)

$patch = [byte[]](0xB8,0x57,0x00,0x07,0x80,0xC3)
# ruleid: ps-amsi-bypass-string-indicators
$ptr = [Win32]::GetProcAddress([Win32]::LoadLibrary("amsi.dll"), "AmsiScanBuffer")
[System.Runtime.InteropServices.Marshal]::Copy($patch, 0, $ptr, 6)

# ok: ps-amsi-bypass-string-indicators
Write-Host "Checking security posture of this system"

# ok: ps-amsi-bypass-string-indicators
$modules = Get-Module -ListAvailable | Where-Object { $_.Name -like "PSReadLine" }
