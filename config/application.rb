require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LetsDev
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_mailer.preview_path = 'spec/mailers/previews'

    config.eager_load_paths += %W(#{config.root}/lib)

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
