def some_func(arg1,arg2,arg3)
    #ruleid: check-regex-dos
    /#{arg1}/i =~ arg2
end

def some_func2(arg1,arg2,arg3)
    #ruleid: check-regex-dos
    Regexp.new(arg3).match("some_string")
end

def some_rails_controller
    foo = params[:some_regex]
    #ruleid: check-regex-dos
    Regexp.new(foo).match("some_string")
end

def use_params_in_regex
  #ruleid: check-regex-dos
  @x = something.match /#{params[:x]}/
end

def regex_on_params
  #ok: check-regex-dos
  @x = params[:x].match /foo/
end