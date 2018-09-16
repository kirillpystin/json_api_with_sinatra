require_relative '../spec_helper'
require_relative '../../app_one'
require 'json'

describe 'genius' do
  include Rack::Test::Methods

  it 'create object' do
    @genius = Genius.create(name: 'Dr. Farworoth', try_kill: 40, crazy: 50, created: Time.now)
    expect(@genius).to be_valid
    puts (@genius.created ? "Genius(id:1) created" : @genius.error.full_message)
  end

  it 'valodation' do
    genius = Genius.first(id: 1)
    expect(genius.name).to eq("Dr. Farworoth")
    expect(genius.try_kill).to eq(40)
    expect(genius.crazy).to eq(50)
    puts "Step-1. Genius(id:1) validation"
  end
end
