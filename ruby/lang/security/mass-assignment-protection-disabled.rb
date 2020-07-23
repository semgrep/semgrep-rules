# ruleid:
User.new(params[:user], :without_protection => true)

# ok
User.new(params[:user])