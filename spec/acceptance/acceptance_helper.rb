ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'rack/test'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include Capybara
end

require_relative '../../app_one'

Capybara.app = Sinatra::Application
