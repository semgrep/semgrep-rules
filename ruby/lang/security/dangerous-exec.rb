require 'open3'

def test_params()
  user_input = params['some_key']
# ruleid: dangerous-exec
  exec("ls -lah #{user_input}")

# ruleid: dangerous-exec
  Process.spawn([user_input, "smth"])

# ruleid: dangerous-exec
  output = exec(["sh", "-c", user_input])

# ruleid: dangerous-exec
  pid = spawn(["bash", user_input])

  commands = "ls -lah /raz/dva"
# ok: dangerous-exec
  system(commands)

  cmd_name = "sh"
# ok: dangerous-exec
  Process.exec([cmd_name, "ls", "-la"])
# ok: dangerous-exec
  Open3.capture2({"FOO" => "BAR"}, [cmd_name, "smth"])
# ok: dangerous-exec
  system("ls -lah /tmp")
# ok: dangerous-exec
  exec(["ls", "-lah", "/tmp"])
end

def test_calls(user_input)
  # ruleid: dangerous-exec
    exec("ls -lah #{user_input}")
  
  # ruleid: dangerous-exec
    Process.spawn([user_input, "smth"])
  
  # ruleid: dangerous-exec
    output = exec(["sh", "-c", user_input])
  
  # ruleid: dangerous-exec
    pid = spawn(["bash", user_input])
  
    commands = "ls -lah /raz/dva"
  # ok: dangerous-exec
    system(commands)
  
    cmd_name = "sh"
  # ok: dangerous-exec
    Process.exec([cmd_name, "ls", "-la"])
  # ok: dangerous-exec
    Open3.capture2({"FOO" => "BAR"}, [cmd_name, "smth"])
  # ok: dangerous-exec
    system("ls -lah /tmp")
  # ok: dangerous-exec
    exec(["ls", "-lah", "/tmp"])
  end

  def test_params2()
    user_input = params['some_key']
  # ruleid: dangerous-exec
    exec("ls -lah #{user_input}")

  # ruleid: dangerous-exec
    Process.spawn([user_input, "smth"])

  # ruleid: dangerous-exec
    output = exec(["sh", "-c", user_input])

  # ruleid: dangerous-exec
    pid = spawn(["bash", user_input])

    commands = "ls -lah /raz/dva"
  # ok: dangerous-exec
    system(commands)

    cmd_name = "sh"
  # ok: dangerous-exec
    Process.exec([cmd_name, "ls", "-la"])
  # ok: dangerous-exec
    Open3.capture2({"FOO" => "BAR"}, [cmd_name, "smth"])
  # ok: dangerous-exec
    system("ls -lah /tmp")
  # ok: dangerous-exec
    exec(["ls", "-lah", "/tmp"])
  end
  
  def test_cookies()
    user_input = cookies['some_cookie']
    # ruleid: dangerous-exec
      exec("ls -lah #{user_input}")
    
    # ruleid: dangerous-exec
      Process.spawn([user_input, "smth"])
    
    # ruleid: dangerous-exec
      output = exec(["sh", "-c", user_input])
    
    # ruleid: dangerous-exec
      pid = spawn(["bash", user_input])
    
      commands = "ls -lah /raz/dva"
    # ok: dangerous-exec
      system(commands)
    
      cmd_name = "sh"
    # ok: dangerous-exec
      Process.exec([cmd_name, "ls", "-la"])
    # ok: dangerous-exec
      Open3.capture2({"FOO" => "BAR"}, [cmd_name, "smth"])
    # ok: dangerous-exec
      system("ls -lah /tmp")
    # ok: dangerous-exec
      exec(["ls", "-lah", "/tmp"])
    end

  def test_issue_3396(inputs)
    @input = inputs[1]
    # Case 1 from issue #3396: a single-string command with an
    # interpolated instance variable goes through a shell.
    # ruleid: dangerous-exec
    system "echo #{@input}"
    # Case 2 from issue #3396: the multi-argument form does not invoke
    # a shell, so the tainted argument is passed directly and is safe.
    # ok: dangerous-exec
    system "echo", @input
  end

  def test_issue_3396_cross_method
    # Case 3 from issue #3396: the same interpolated instance variable
    # in another method. Instance variables can be set from user input
    # in a different method, which intra-procedural taint cannot see,
    # so an interpolated instance variable is treated as untrusted.
    # ruleid: dangerous-exec
    system "echo #{@input}"
    # Case 4 from issue #3396: multi-argument form, safe.
    # ok: dangerous-exec
    system "echo", @input
  end

  def test_issue_3396_shell_flag(user_input)
    # A shell invoked with -c in multi-argument form is still dangerous.
    # ruleid: dangerous-exec
    system("sh", "-c", user_input)
    # ruleid: dangerous-exec
    system({"FOO" => "bar"}, "sh", "-c", user_input)
    # Multi-argument form with extra flags is safe when the command is
    # a literal and no shell is involved.
    # ok: dangerous-exec
    system("echo", "-n", user_input)
    # ok: dangerous-exec
    system({"FOO" => "bar"}, "echo", user_input)
    # A single tainted argument is still a shell command.
    # ruleid: dangerous-exec
    system(user_input)
    # Interpolation of a plain local holding a literal is not tainted.
    safe = "world"
    # ok: dangerous-exec
    system("echo #{safe}")
  end