require 'rubygems'
require 'bundler/setup'

require "rspec"
require "capybara/rspec"
require "capybara/dsl" 
require "debugger"
require "selenium/webdriver"

spec_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(spec_dir)

# Require all ruby files in the 'support' folder
Dir[File.join(spec_dir, "support/**/*.rb")].each {|f| require f}

# RSpec config here
RSpec.configure do |config|

  # Capybara config here
  Capybara.configure do |capybara|
    # Don't run a rack app
    capybara.run_server = false

    # Define your app host here
    capybara.app_host = "http://www.google.com"

    # I'm using the mechanize driver but your free to use your favorite one (env-js, selenium, ...)
    capybara.default_driver = :selenium
  end

  # Don't forget to tell to RSpec to include Capybara :)
  config.include Capybara::DSL
  
end
