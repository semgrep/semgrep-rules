
// test code from https://pumascan.com/rules/#sec0031-command-injection-process-start
class Foo{  
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Run(ProcessViewModel model)
    {
        // ruleid:command-injection-process-start 
        Process p = Process.Start(model.FileName);
        model.ExitCode = p.ExitCode;
        return View(model);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Run(ProcessViewModel model)
    {
        //Pull valid commands from the configuration file
        List<Command> commands = GetCommands();

        //Verify the command exists
        
        Command c = commands.FirstOrDefault(i => i.Id == model.FileId);
        if (c == null)
            throw new ArgumentException("Invalid file name parameter");
        // ok:command-injection-process-start 
        Process p = Process.Start(c.FileName);
        model.ExitCode = p.ExitCode;
        return View(model);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Run(ProcessViewModel model)
    {
        ProcessStartInfo info = new ProcessStartInfo()
        {
            FileName = model.FileName,
        };
        // ruleid:command-injection-process-start
        Process p = Process.Start(info);
        model.ExitCode = p.ExitCode;
        return View(model);
    }
    
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Run(ProcessViewModel model)
    {
        //Pull valid commands from the configuration file
        List<Command> commands = GetCommands();

        //Verify the command exists
        Command c = commands.FirstOrDefault(i => i.Id == model.FileId);
        if (c == null)
            throw new ArgumentException("Invalid file name parameter");

        ProcessStartInfo info = new ProcessStartInfo()
        {
            FileName = c.FileName,
        };
        // ok:command-injection-process-start
        Process p = Process.Start(info);
        model.ExitCode = p.ExitCode;
        return View(model);
    }
}
            