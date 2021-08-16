# ruleid: avoid-session-manipulation
id = session[params[:uid]]

# ok: avoid-session-manipulation
id = session[user_id]
