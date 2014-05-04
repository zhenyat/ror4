require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"s

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

################################################################################
# require 'yaml'
# ZT_CONFIG = YAML.load(File.read(File.expand_path('../ZT_config.yml', __FILE__)))
# ZT_CONFIG = YAML.load_file("#{Rails.root}/config/zt_config.yml")
# puts ZT_CONFIG['zt_initializer']
#   or Sample 2:
# if File.exists?(File.expand_path('../application.yml', __FILE__))
#   config = YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))
#   config.merge! config.fetch(Rails.env, {})
#   config.each do |key, value|
#     ENV[key] ||= value.to_s unless value.kind_of? Hash
#   end
# end
#     NB! add application.yml to .gitignore
################################################################################

module Ror4
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Moscow'   #ZT: uncommented

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
#ZT config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]

#    config.i18n.enforce_available_locales = true  Not needed as checked with 4.0.1 #ZT: put here to avoid deprecation message since 4.0.2 / 3.2.16
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]  #ZT: Multifile structure
    config.i18n.default_locale = :ru  #ZT
  end
#  puts "ZT: root= " + Rails.root.to_s if !Rails.root.nil?
#puts "ZT: NO root= " if Rails.root.nil?
#puts "ZT: App.root= " + Application.root.to_s if !Rails.root.nil?

end
