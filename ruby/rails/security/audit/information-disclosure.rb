Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Show full error reports and disable caching.
  # ruleid: information-disclosure
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
end

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Show full error reports and disable caching.
  # ok: information-disclosure
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
end

class ConfigController < ApplicationController
  # ruleid: information-disclosure
  def show_detailed_exceptions?
    return true
  end
end

class ConfigController < ApplicationController
  # ok: information-disclosure
  def show_detailed_exceptions?
    return false
  end
end
