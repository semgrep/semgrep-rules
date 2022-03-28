using System.Diagnostics;

namespace Injections
{
    public class OsCommandInjection
    {
        // ruleid: os-command-injection
        public void RunOsCommand(string command)
        {
            var process = Process.Start(command);
        }

        // ok: os-command-injection
        public void RunOsCommand(string command)
        {
            var process = Process.Start("constant");
        }


        // ruleid: os-command-injection
        public void RunOsCommandWithArgs(string command, string arguments)
        {
            var process = Process.Start(command, arguments);
        }

        // ok: os-command-injection
        public void RunOsCommandWithArgs(string command, string arguments)
        {
            var process = Process.Start("constant", "constant");
        }


        // ruleid: os-command-injection
        public void RunOsCommandWithProcessParam(string command)
        {
            Process process = new Process();

            process.StartInfo.FileName = command;
            process.Start();
        }

        // ok: os-command-injection
        public void RunOsCommandWithProcessParam(string command)
        {
            Process process = new Process();

            process.StartInfo.FileName = "constant";
            process.Start();
        }


        // ruleid: os-command-injection
        public void RunOsCommandAndArgsWithProcessParam(string command, string arguments)
        {
            Process process = new Process();

            process.StartInfo.FileName = command;
            process.StartInfo.Arguments = arguments;
            process.Start();
        }

        // ok: os-command-injection
        public void RunOsCommandAndArgsWithProcessParam(string command, string arguments)
        {
            Process process = new Process();

            process.StartInfo.FileName = "constant";
            process.StartInfo.Arguments = "constant";
            process.Start();
        }


        // ruleid: os-command-injection
        public void RunOsCommandWithStartInfo(string command)
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo()
            {
                FileName = command
            };

            var process = Process.Start(processStartInfo);
        }

        // ok: os-command-injection
        public void RunOsCommandWithStartInfo(string command)
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo()
            {
                FileName = "constant"
            };

            var process = Process.Start(processStartInfo);
        }


        // ruleid: os-command-injection
        public void RunConstantAppWithArgs(string args)
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo()
            {
                FileName = "constant",
                Arguments = args
            };

            var process = Process.Start(processStartInfo);
        }

        // ok: os-command-injection
        public void RunConstantAppWithArgs(string args)
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo()
            {
                FileName = "constant",
                Arguments = "constant"
            };

            var process = Process.Start(processStartInfo);
        }
    }
}
