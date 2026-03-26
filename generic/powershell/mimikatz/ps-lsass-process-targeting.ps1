# ruleid: ps-lsass-process-targeting
$lsass = Get-Process lsass
# ruleid: ps-lsass-process-targeting
$handle = [Win32]::OpenProcess(0x1F0FFF, $false, $lsass.Id)

# ruleid: ps-lsass-process-targeting
$processId = (Get-Process lsass).Id
# ruleid: ps-lsass-process-targeting
$hProcess = [Win32]::OpenProcess(0x1F0FFF, $false, $processId)
[Win32]::MiniDumpWriteDump($hProcess, $processId, $fileStream, 2, [IntPtr]::Zero, [IntPtr]::Zero, [IntPtr]::Zero)

# ruleid: ps-lsass-process-targeting
$lsassHandle = OpenProcess 0x1F0FFF $false (Get-Process lsass).Id

# ok: ps-lsass-process-targeting
$procs = Get-Process | Where-Object { $_.CPU -gt 50 }
Write-Host "High CPU processes: $($procs.Count)"

# ok: ps-lsass-process-targeting
Get-Process | Where-Object { $_.WorkingSet64 -gt 500MB } | Select-Object Name, Id
