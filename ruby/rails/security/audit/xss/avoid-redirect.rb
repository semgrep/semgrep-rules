# ruleid: avoid-redirect
redirect_to(url_for(params))

# ruleid: avoid-redirect
redirect_to(params[:t])

# ruleid: avoid-redirect
redirect_to(User.where(x))

# ok: avoid-redirect
redirect_to params.merge(:only_path => true)

# ok: avoid-redirect
redirect_to params.merge(:host => 'example_host.com')
