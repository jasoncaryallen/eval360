require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Eval360
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.generators do |g|
      g.view_specs false
      g.helper_specs false
      g.controller_specs false
      g.model_specs false
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework :rspec
      g.factory_bot dir: "/spec/factories/"
    end

    config.serve_static_files = true

    config.active_record.belongs_to_required_by_default = false

    config.x.loi = "YearlongIndividual"

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
