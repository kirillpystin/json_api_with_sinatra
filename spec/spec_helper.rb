require 'sinatra'
require 'rspec'
require 'rack/test'
require 'capybara/dsl'

ENV['RACK_ENV'] = 'test'

def app
  Sinatra::Application.new
end
