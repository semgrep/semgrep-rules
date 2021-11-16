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
