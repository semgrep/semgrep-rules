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

def self.call(params)
  # ok: avoid-tainted-shell-call
  new(params).call
end

def self.execute(site, params, user)
  # ok: avoid-tainted-shell-call
  new(site, params, user).execute
end

def self.execute(relation, params)
  # ok: avoid-tainted-shell-call
  new(relation, params).execute
end

def self.execute(relation, params, site)
  # ok: avoid-tainted-shell-call
  new(relation, params, site).execute
end
