# ruleid: ps-mimikatz-command-strings
Invoke-Mimikatz -Command "sekurlsa::logonpasswords"

# ruleid: ps-mimikatz-command-strings
Invoke-Mimikatz -Command '"lsadump::sam /patch"'

# ruleid: ps-mimikatz-command-strings
$mimikatzCmd = "privilege::debug lsadump::dcsync /domain:corp.example.com /user:krbtgt"
Invoke-Expression ".\mimikatz.exe $mimikatzCmd"

# ruleid: ps-mimikatz-command-strings
Invoke-Mimikatz -DumpCreds

# ok: ps-mimikatz-command-strings
Write-Host "Security audit: checking credential hygiene per policy"

# ok: ps-mimikatz-command-strings
Get-ADUser -Filter * -Properties PasswordLastSet | Select-Object Name, PasswordLastSet
