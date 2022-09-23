# ruleid:ruby-eval
Array.class_eval(cookies['tainted_cookie'])

def zen
  41
end

# ok:ruby-eval
eval("def zen; 42; end")

puts zen

class Thing
end
a = %q{def hello() "Hello there!" end}
# not user-controllable, this is ok
# ok:ruby-eval
Thing.module_eval(a)
puts Thing.new.hello()
b = params['something']
# ruleid:ruby-eval
Thing.module_eval(b)

# ruleid:ruby-eval
eval(b)
# ruleid:ruby-eval
eval(b,some_binding)

def get_binding(param)
  binding
end
b = get_binding("hello")
# ok:ruby-eval
b.eval("some_func")

# ok:ruby-eval
eval("some_func",b)

# ruleid:ruby-eval
eval(params['cmd'],b)

# ruleid:ruby-eval
eval(params.dig('cmd'))

# ruleid:ruby-eval
eval(cookies.delete('foo'))

# ruleid:ruby-eval
RubyVM::InstructionSequence.compile(foo).eval

# ok:ruby-eval
RubyVM::InstructionSequence.compile("1 + 2").eval

iseq = RubyVM::InstructionSequence.compile(foo)
# ruleid:ruby-eval
iseq.eval


iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
# ok:ruby-eval
iseq.eval

