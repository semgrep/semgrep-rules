#rails2
ActionController::Base.session = {
  :key         => '_rails2_session',
  :secret      => 'secret!',
  # ruleid: check-cookie-store-session-security-attributes
  :session_http_only   => false
}

#rails3
# ruleid: check-cookie-store-session-security-attributes
Rails3::Application.config.session_store :cookie_store, :key => '_rails3_session', :httponly => false, :secure => false

#rails3
# ruleid: check-cookie-store-session-security-attributes
Rails3::Application.config.session_store :cookie_store, :key => '_rails3_session', :secure => false

#rails3
# ruleid: check-cookie-store-session-security-attributes
Rails3::Application.config.session_store :cookie_store, :httponly => false, :key => '_rails3_session'

# ruleid: check-cookie-store-session-security-attributes
Rails.application.config.session_store :cookie_store, httponly: false

# ok: check-cookie-store-session-security-attributes
Rails.application.config.session_store :cookie_store, some_harmless_key: false
