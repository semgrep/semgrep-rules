# ruleid:missing-csrf-protection
class DangerousController < ActionController

  puts "do more stuff"

end

# ok
class OkController < ActionController

  protect_from_forgery :with => :exception

  puts "do more stuff"

end
