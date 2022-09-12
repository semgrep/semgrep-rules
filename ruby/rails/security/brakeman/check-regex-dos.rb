def some_rails_controller
  foo = params[:some_regex]
  #ruleid: check-regex-dos
  Regexp.new(foo).match("some_string")
end

def some_rails_controller
  foo = Record[something]
  #ruleid: check-regex-dos
  Regexp.new(foo).match("some_string")
end

def some_rails_controller
  foo = Record.read_attribute("some_attribute")
  #ruleid: check-regex-dos
  Regexp.new(foo).match("some_string")

  bar = ENV['someEnvVar']
  #ok: check-regex-dos
  Regexp.new(bar).match("some_string")
end

def use_params_in_regex
#ruleid: check-regex-dos
@x = something.match /#{params[:x]}/
end

def regex_on_params
#ok: check-regex-dos
@x = params[:x].match /foo/
end