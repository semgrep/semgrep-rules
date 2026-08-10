# ruleid: ps-amsi-bypass-reflection
[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)

# ruleid: ps-amsi-bypass-reflection
$assembly = [Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')
$field = $assembly.GetField('amsiInitFailed', 'NonPublic,Static')
$field.SetValue($null, $true)

# ruleid: ps-amsi-bypass-reflection
[Ref].Assembly.GetType("System.Management.Automation.AmsiUtils").GetField("amsiContext","NonPublic,Static").SetValue($null,[IntPtr]::Zero)

# ok: ps-amsi-bypass-reflection
Write-Host "This script does not use reflection to disable AMSI"

# ok: ps-amsi-bypass-reflection
$type = [System.IO.File]
$type.GetMethod("ReadAllText").Invoke($null, @("C:\file.txt"))
