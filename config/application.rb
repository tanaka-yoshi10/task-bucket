require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskBucket
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.generators do |generator|
      generator.test_framework :rspec,
                               fixtures: false,
                               view_specs: false,
                               helper_specs: false,
                               routing_specs: false,
                               controller_specs: false,
                               request_specs: false
      generator.fixture_replacement :factory_bot, dir: 'spec/factories'
      generator.assets false
      generator.helper false
      generator.javascripts false
      generator.stylesheets false
    end

    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
  end
end
