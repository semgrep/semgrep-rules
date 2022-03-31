#rails2
ActionController::Base.session = {
  :key         => '_rails2_session',
  #ruleid: check-rails-session-secret-handling
  :secret      => 'secret!',
  :session_http_only   => false
}

#rails2
ActionController::Base.session = {
  :key         => '_rails2_session',
  #ok: check-rails-session-secret-handling
  :secret      => ENV['mysecret'],
  :session_http_only   => false
}

#ruleid: check-rails-session-secret-handling
Rails3::Application.config.secret_token = '5cd420fa1791cbbe44796ff5d37af5eaea9e4a821c18cb4947c5a0002ca5751970e0376909bc6ee8da7430982f1e529ee856512abb1f1d6ea442c021893cb993'

#ruleid: check-rails-session-secret-handling
Rails4::Application.config.secret_key_base = '3d90f727dcc14992232b9461fac5d31cf2bc184854e0afd90ae67e0ae48f22b676ee2529c84d4c23bc2a9c7be6eeefcf202b91ccb8d04e7b87a85c852f6784d6'

#ok: check-rails-session-secret-handling
MyRailsApp::Application.config.secret_token = ENV["SECRET_TOKEN"]