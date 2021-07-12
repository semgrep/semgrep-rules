def test_calls(user_input)
# ruleid: dangerous-subshell
  result = `foo #{user_input} bar`

# ruleid: dangerous-subshell
  result2 = %x{foo #{user_input} bar}

# ruleid: dangerous-subshell
  cmd = `foo #{user_input} bar #{smth_else}`

# ok: dangerous-subshell
  smth = `ls testdir`.split[1]

# ok: dangerous-subshell
  ok_cmd = `echo oops && exit 99`

  hardcode = "testdir"
# ok: dangerous-subshell
  ok_cmd2 = %{ls #{hardcode} -lah}

end
