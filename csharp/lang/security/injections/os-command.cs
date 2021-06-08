using System.Diagnostics;

namespace Injections
{
    public class OsCommandInjection
    {
        public void RunOsCommand(string command)
        {
            // ruleid: os-command-injection
            var process = Process.Start(command);
        }

        public void RunOsCommandWithStartInfo(string command)
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo()
            {
                FileName = command
            };
            
            // ruleid: os-command-injection
            var process = Process.Start(processStartInfo);
        }

        public void RunPythonWithArgs(string args)
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo()
            {
                FileName = @"python.exe",
                Arguments = args,
                UseShellExecute = false
            };

            // ruleid: os-command-injection
            var process = Process.Start(processStartInfo);
        }
    }
}
