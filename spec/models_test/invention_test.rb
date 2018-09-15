require_relative '../spec_helper'
require_relative '../../app_one'
require 'json'

describe 'invent' do
  include Rack::Test::Methods

  it 'create object' do
    @invent = Invent.create('name_arm': 'Lazer gun', 'power': 60, 'genius_id':1, )
    puts (@invent ? 'Invention-1 created' : @invent.error.full_message)
    expect(@invent).to be_valid
  end

  it 'create associated object' do
    @invent = Genius.first(id: 1).add_invent('name_arm': 'Kekteport', 'power': 50)
    puts (@invent ? 'Invention-2 created' : @invent.error.full_message)
  end


  it 'valodation' do
    invent = Invent.first(id:1)
    a = expect(invent.name_arm).to eq('Lazer gun')
    b = expect(invent.power).to eq(60)
    puts (a&&b ? "Step-2. Model Invent validation" : "Error")
  end

end
