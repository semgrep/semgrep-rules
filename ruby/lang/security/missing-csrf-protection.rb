# ruleid:missing-csrf-protection
class DangerousController < ActionController::Base

  puts "do more stuff"

end

# ok:missing-csrf-protection
class OkController < ActionController::Base

  protect_from_forgery :with => :exception

  puts "do more stuff"

end

# ok:missing-csrf-protection
class OkController < ActionController::Base

  protect_from_forgery prepend: true, with: :exception

  puts "do more stuff"

end
