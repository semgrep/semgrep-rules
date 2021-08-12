# ruleid: avoid-link-to
link_to "Profile#{user_input}", profile_path(@profile)

# ok: avoid-link-to
link_to "Profile", profile_path(@profile)
