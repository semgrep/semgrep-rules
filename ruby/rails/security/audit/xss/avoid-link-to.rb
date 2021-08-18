# ruleid: avoid-link-to
link_to "#{params[:url]}/profile", profile_path(@profile)

# ruleid: avoid-link-to
link_to "#{h(cookies[:url])}/profile", profile_path(@profile)

url = request.env[:url]
# ruleid: avoid-link-to
link_to url, profile_path(@profile)

# ruleid: avoid-link-to
link_to "#{h(User.url(x))}/profile", profile_path(@profile)

# ok: avoid-link-to
link_to "Profile#{params[:url]}", profile_path(@profile)

# ok: avoid-link-to
link_to "Profile", profile_path(@profile)
