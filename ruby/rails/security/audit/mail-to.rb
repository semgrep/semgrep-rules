def bad1(email, domain)
  # ruleid: mail-to
  mail_to domain, email, :encode => "javascript"
end

def bad2()
  # ruleid: mail-to
  mail_to domain, "email", :replace_at => "_at_", encode: "javascript", :replace_dot => "_dot_", :class => "email"
end

def ok1()
  # ok: mail-to
  mail_to "me@domain.com", "My email", :encode => "hex"
end

def ok2()
  # ok: mail-to
  mail_to "me@domain.com", "My email", encode: "javascript"
end

def ok3()
  # ok: mail-to
  mail_to escape_javascript("me@domain.com"), escape_javascript("My email"), :encode => "javascript"
end
