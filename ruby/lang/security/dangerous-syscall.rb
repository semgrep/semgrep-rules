def test
  # ruleid:dangerous-syscall
  syscall 4, 1, "hello\n", 6   # '4' is write(2) on our box
end
