class MyClass:
  some_attr = 3
  def is_positive(self):
    return self.some_attr > 0

example = MyClass()
# ok
example.is_positive()
# ruleid:is-function-without-parentheses
if (example.is_positive):
  do_something()
elif (example.some_attr):
  do_something_else()
else:
  return