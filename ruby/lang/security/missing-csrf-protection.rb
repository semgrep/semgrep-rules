# ruleid:missing-csrf-protection
class DangerousController < ApplicationController

  puts "do more stuff"

end

# ok
class OkController < ApplicationController

  protect_from_forgery :with => :exception

  puts "do more stuff"

end