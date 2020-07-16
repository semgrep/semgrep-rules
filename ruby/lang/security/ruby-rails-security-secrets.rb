# ruleid:ruby-rails-security-secrets
password = "SUPERSECRET"

# ok
password = some_var

# ruleid:ruby-rails-security-secrets
PASSWORD_FOO = "SUPERSECRET"

# ruleid:ruby-rails-security-secrets
secret = "SUPERSECRET"

# ok
secret = 1.0

# Ignore this case for now
# ok
secret = "SUPERSECRET" + user_var

# ruleid:ruby-rails-security-secrets
MY_SECRET = "SUPERSECRET"

# ruleid:ruby-rails-security-secrets
REST_AUTH_SITE_KEY = "SUPERSECRET"

# ruleid:ruby-rails-security-secrets
API_KEY = "SUPERSECRET"

# ruleid:ruby-rails-security-secrets
MY_API_KEY = "SUPERSECRET"