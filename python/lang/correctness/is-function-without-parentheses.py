class MyClass:
  some_attr = 3
  def is_positive(self):
    return self.some_attr > 0

example = MyClass()
# ok:is-function-without-parentheses
example.is_positive()
# ruleid:is-function-without-parentheses
if (example.is_positive):
  do_something()
# ok:is-function-without-parentheses
elif (example.some_attr):
  do_something_else()
else:
  return
