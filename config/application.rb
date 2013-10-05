require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, :assets, Rails.env)

module Greenarea
  class Application < Rails::Application

    config.active_record.whitelist_attributes = false

    config.autoload_paths += %W(#{config.root}/lib)

    config.assets.enabled = true

    config.assets.initialize_on_precompile = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.active_record.whitelist_attributes = false

    config.generators do |g|
      g.helper false
      g.assets false
      g.view_specs false

      g.test_framework :rspec,
        fixtures:         true,
        view_specs:       false,
        helper_specs:     false,
        routing_specs:    true,
        controller_specs: true,
        request_specs:    true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    config.from_file 'settings.yml'

    config.action_mailer.smtp_settings = {
      :address              => Rails.configuration.email.host,
      :port                 => Rails.configuration.email.port,
      :domain               => Rails.configuration.email.domain,
      :user_name            => Rails.configuration.email.username,
      :password             => Rails.configuration.email.password,
      :authentication       => :plain,
      :enable_starttls_auto => true
    }

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.paths << Rails.root.join('app', 'assets', 'images')

    config.assets.precompile += %w( .svg .eot .woff .ttf )
  end
end

module Dashboard ; end
