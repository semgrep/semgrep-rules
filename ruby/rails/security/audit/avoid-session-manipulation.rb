# ruleid: avoid-session-manipulation
id = session[params[:uid]]

uid = params[:uid]
# ruleid: avoid-session-manipulation
id = session[uid]

# ok: avoid-session-manipulation
id = session[user_id]
