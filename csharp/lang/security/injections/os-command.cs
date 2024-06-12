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

        public void RunOsCommand(string command)
        {
            // ok: os-command-injection
            var process = Process.Start("constant");
        }


        public void RunOsCommandWithArgs(string command, string arguments)
        {
            // ruleid: os-command-injection
            var process = Process.Start(command, arguments);
        }

        public void RunOsCommandWithArgs(string command, string arguments)
        {
            // ok: os-command-injection
            var process = Process.Start("constant", "constant");
        }


        public void RunOsCommandWithProcessParam(string command)
        {
            Process process = new Process();

            process.StartInfo.FileName = command;
            // ruleid: os-command-injection
            process.Start();
        }

        public void RunOsCommandWithProcessParam(string command)
        {
            Process process = new Process();

            process.StartInfo.FileName = "constant";
            // ok: os-command-injection
            process.Start();
        }


        public void RunOsCommandAndArgsWithProcessParam(string command, string arguments)
        {
            Process process = new Process();

            process.StartInfo.FileName = command;
            process.StartInfo.Arguments = arguments;
            // ruleid: os-command-injection
            process.Start();
        }

        public void RunOsCommandAndArgsWithProcessParam(string command, string arguments)
        {
            Process process = new Process();

            process.StartInfo.FileName = "constant";
            process.StartInfo.Arguments = "constant";
            // ok: os-command-injection
            process.Start();
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

        public void RunOsCommandWithStartInfo(string command)
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo()
            {
                FileName = "constant"
            };

            // ok: os-command-injection
            var process = Process.Start(processStartInfo);
        }


        public void RunConstantAppWithArgs(string args)
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo()
            {
                FileName = "constant",
                Arguments = args
            };

            // ruleid: os-command-injection
            var process = Process.Start(processStartInfo);
        }

        public void RunConstantAppWithArgs(string args)
        {
            ProcessStartInfo processStartInfo = new ProcessStartInfo()
            {
                FileName = "constant",
                Arguments = "constant"
            };

            // ok: os-command-injection
            var process = Process.Start(processStartInfo);
        }

        public void RunOsCommandAndArgsWithProcessParam(string command, string arguments)
        {
            Process process = new Process
            {
                StartInfo = new ProcessStartInfo
                {
                    FileName = command,
                    Arguments = args
                }
            };

            // ruleid: os-command-injection
            process.Start();
        }

        public void RunOsCommandAndArgsWithProcessParam(string command, string arguments)
        {
            Process process = new Process
            {
                StartInfo = new ProcessStartInfo
                {
                    FileName = "constant",
                    Arguments = arguments
                }
            };

            // ruleid: os-command-injection
            process.Start();
        }

        public void RunOsCommandAndArgsWithProcessParam(string command, string arguments)
        {
            Process process = new Process
            {
                StartInfo = new ProcessStartInfo
                {
                    FileName = command,
                    Arguments = "constant"
                }
            };

            // ruleid: os-command-injection
            process.Start();
        }

        public void RunOsCommandAndArgsWithProcessParam(string command, string arguments)
        {
            Process process = new Process
            {
                StartInfo = new ProcessStartInfo
                {
                    FileName = "constant",
                    Arguments = "constant"
                }
            };

            // ok: os-command-injection
            process.Start();
        }
    }
}
