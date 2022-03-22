public class TestExecutor {

    private Pair<Integer, String> test1(String command, Logger logAppender) throws IOException {
      String[] cmd = new String[3];
      String osName = System.getProperty("os.name");
      if (osName.startsWith("Windows")) {
          cmd[0] = "cmd.exe";
          cmd[1] = "/C";
      } else {
          cmd[0] = "/bin/bash";
          cmd[1] = "-c";
      }
      cmd[2] = command;

      // ruleid: command-injection-process-builder
      ProcessBuilder builder = new ProcessBuilder(cmd);
      builder.redirectErrorStream(true);
      Process proc = builder.start();
      return Pair.newPair(1, "Killed");
    }

    public String test2(String userInput) {
      ProcessBuilder builder = new ProcessBuilder();
      // ruleid: command-injection-process-builder
      builder.command(userInput);
      return "foo";
    }

    public String test3(String userInput) {
      ProcessBuilder builder = new ProcessBuilder();
      // ruleid: command-injection-process-builder
      builder.command("bash", "-c", userInput);
      return "foo";
    }

    public String test4(String userInput) {
      ProcessBuilder builder = new ProcessBuilder();
      // ruleid: command-injection-process-builder
      builder.command("cmd", "/c", userInput);
      return "foo";
    }

    public String okTest() {
      ProcessBuilder builder = new ProcessBuilder();
      // ok: command-injection-process-builder
      builder.command("bash", "-c", "ls");
      return "foo";
    }


}
