# ok:dangerous-open
cmd = open("|date")
print cmd.gets
cmd.close

filename = "testfile"
# ok:dangerous-open
open(filename) do |f|
  print f.gets
end

# ruleid:dangerous-open
cmd = open("|%s" % user_input)
print cmd.gets
cmd.close

# ruleid:dangerous-open
cmd = open(Kernel::sprintf("|%s", user_input))
print cmd.gets
cmd.close
