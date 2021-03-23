require 'open3'

def test_calls(user_input)
# ruleid: dangerous-exec
  exec("ls -lah #{user_input}")

# ruleid: dangerous-exec
  Process.spawn([user_input, "smth"])

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
