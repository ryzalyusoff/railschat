require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Railschat
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # GMAIL SMPTP
    #ActionMailer::Base.smtp_settings = {
    #  :address              => 'smtp.gmail.com',
    # :domain               => 'mail.google.com',
    #   :port                 => 587,
    #   :user_name            => Rails.application.secrets.smtp_domain,
    #   :password             => Rails.application.secrets.smtp_password,
    #   :authentication       => 'login',
    #   :enable_starttls_auto => true
    #}

    # SENDGRID SMTP
    ActionMailer::Base.smtp_settings = {
      :address        => 'smtp.sendgrid.net',
      :port           => 587,
      :authentication => :plain,
      :domain => Rails.application.secrets.smtp_domain,
      :user_name      => Rails.application.secrets.smtp_username,
      :password       => Rails.application.secrets.smtp_password
    }

  end
end
