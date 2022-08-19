def foo

  # ruleid: avoid-tainted-shell-call
  Shell.cat(params[:filename])

  sh = Shell.cd("/tmp")
  # ruleid: avoid-tainted-shell-call
  sh.open(params[:filename])

  sh = Shell.new
  fn = params[:filename]
  # ruleid: avoid-tainted-shell-call
  sh.open(fn)

  # ok: avoid-tainted-shell-call
  Shell.cat("/var/log/www/access.log")

end

def foo2(param1)
  # ok: avoid-tainted-shell-call
  new(params).call
end

def foo3(param1, param2, param3)
  # ok: avoid-tainted-shell-call
  new(param1, params2, param3).execute
end

def foo4(param1, param2)
  # ok: avoid-tainted-shell-call
  new(param1, param2).execute
end

def foo5(param1, param2, param3)
  # ok: avoid-tainted-shell-call
  new(param1, param2, param3).execute
end
