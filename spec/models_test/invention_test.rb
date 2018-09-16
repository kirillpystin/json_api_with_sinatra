require_relative '../spec_helper'
require_relative '../../app_one'
require 'json'

describe 'invent' do
  include Rack::Test::Methods

  it 'Create Invent-1' do
    @invent = Invent.create('name_arm': 'Lazer gun', 'power': 60, 'genius_id':1, )
    puts (@invent ? 'Invention-1 created' : @invent.error.full_message)
    expect(@invent).to be_valid
  end

  it 'Create Invent-2' do
    @invent = Genius.first(id: 1).add_invent('name_arm': 'Super Gun', 'power': 50)
    puts (@invent ? 'Invention-2 created' : @invent.error.full_message)
  end


  it 'Invent-1 valodation' do
    invent = Invent.first(id:1)
    a = expect(invent.name_arm).to eq('Lazer gun')
    b = expect(invent.power).to eq(60)
    puts (a&&b ? "Step-3. Genius(id:1) Invent(id:1) validation" : "Error")
  end

  it 'Invent-2 valodation' do
    invent = Genius.find(id:1).invents_dataset.first(id: 2)
    a = expect(invent.name_arm).to eq('Super Gun')
    b = expect(invent.power).to eq(50)
    puts (a&&b ? "Step-4. Genius(id:1) Invent(id:2) validation" : "Error")
  end

end
