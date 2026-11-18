# ruleid: ps-registry-run-key-persistence
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "Updater" -Value "powershell.exe -enc SQBFAFgA..."

# ruleid: ps-registry-run-key-persistence
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "SecurityService" -Value "C:\Windows\Temp\svchost.exe" -PropertyType String -Force

# ruleid: ps-registry-run-key-persistence
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v "Persistence" /t REG_SZ /d "powershell -windowstyle hidden -ep bypass -c IEX..."

# ok: ps-registry-run-key-persistence
$value = Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "OneDrive" -ErrorAction SilentlyContinue
Write-Host "OneDrive startup: $($value.OneDrive)"

# ok: ps-registry-run-key-persistence
Set-ItemProperty -Path "HKCU:\SOFTWARE\MyApp" -Name "LastRunDate" -Value (Get-Date).ToString()
