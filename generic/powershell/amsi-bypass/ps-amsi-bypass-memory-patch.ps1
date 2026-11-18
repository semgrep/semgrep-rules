# ruleid: ps-amsi-bypass-memory-patch
$ptr = [Win32]::VirtualProtect($amsiAddr, [uint32]6, 0x40, [ref]0); Add-Type -TypeDefinition 'using System.Runtime.InteropServices; public class W { [DllImport("ntdll")] public static extern bool amsi(); }'

# ruleid: ps-amsi-bypass-memory-patch
AllocHGlobal 1024 | Out-Null; Add-Type -TypeDefinition '[DllImport("kernel32")] public static extern void amsiPatch();'

# ruleid: ps-amsi-bypass-memory-patch
WriteProcessMemory $proc $addr $patch $patch.Length ([ref]0) | Out-Null; Add-Type -MemberDefinition '[DllImport("kernel32")] public static extern bool amsi();' -Name 'Win32' -PassThru

# ok: ps-amsi-bypass-memory-patch
$data = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi($pointer)

# ok: ps-amsi-bypass-memory-patch
Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show("Hello")
