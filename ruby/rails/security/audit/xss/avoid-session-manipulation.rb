# ruleid: avoid-session-manipulation
id = session[params[:uid]]

# ruleid: avoid-session-manipulation
uid = params[:uid]
id = session[uid]

# ok: avoid-session-manipulation
id = session[user_id]
