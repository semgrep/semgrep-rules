# ruleid: ps-pinvoke-injection-apis
Add-Type -TypeDefinition '[DllImport("kernel32.dll")] public static extern IntPtr VirtualAllocEx(IntPtr hProcess, IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);'

# ruleid: ps-pinvoke-injection-apis
Add-Type -TypeDefinition '[DllImport("kernel32.dll")] public static extern bool WriteProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, uint nSize, out uint lpNumberOfBytesWritten);'

# ruleid: ps-pinvoke-injection-apis
Add-Type -MemberDefinition '[DllImport("ntdll.dll")] public static extern uint NtCreateThreadEx(out IntPtr threadHandle, uint desiredAccess, IntPtr objectAttributes, IntPtr processHandle, IntPtr startAddress, IntPtr parameter, bool createSuspended, uint stackZeroBits, uint sizeOfStack, uint maximumStackSize, IntPtr attributeList);' -Name 'Win32' -Namespace 'Win32Functions' -PassThru

# ruleid: ps-pinvoke-injection-apis
Add-Type -TypeDefinition '[DllImport("kernel32")] public static extern IntPtr VirtualAlloc(IntPtr addr, uint size, uint type, uint protect);'

# ruleid: ps-pinvoke-injection-apis
Add-Type -TypeDefinition '[DllImport("kernel32")] public static extern IntPtr QueueUserAPC(IntPtr pfnAPC, IntPtr hThread, IntPtr dwData);'

# ok: ps-pinvoke-injection-apis
Add-Type -AssemblyName System.Drawing
$bitmap = [System.Drawing.Bitmap]::new(100, 100)

# ok: ps-pinvoke-injection-apis
Add-Type -TypeDefinition 'public class Greeter { public static string Hello() { return "Hello World"; } }'
[Greeter]::Hello()
