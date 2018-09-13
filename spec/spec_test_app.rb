require_relative './spec_helper'
require_relative '../app_one'
require 'json'
describe 'Test app' do
	include Rack::Test::Methods
	def app
		Sinatra::Application.new
	end
  # Adding 2 new objects in DB
  it 'add_genius 1', type: :request do
		header = { 'Content-Type' => 'application/json' }
		post '/add', { 'name': 'Morty Sunchez', 'try_kill': 30, 'crazy': 70, 'name_arm': 'Портальная пушка', 'power': 60, 'key_id': 2 }.to_json,header
		expect(last_response.status).to eq(302)
    puts 'Step-1:Crazy saved!'
  end
  it 'add genius 2', type: :request do
		header =  { 'Content-Type' => 'application/json' }
		post '/add', { 'name': 'Dr.Evil', 'try_kill': 30, 'crazy':70,'name_arm': 'Teleport', 'power': 60, 'key_id':3 }.to_json, header
		expect(last_response.status).to eq(302)
    puts 'Step-2:Crazy saved'
  end
  # Print all geniuses from db
  it 'All Geniuses' do
			get '/'
			expect(last_response).to be_ok
			puts 'Step-3:Request "get "/"""-Ok'
  end
	# Genius with id=1
  it 'see info about geniuses invention' do
    get '/crazy/1'
    expect(last_response.status).to eq(200)
    puts 'Step-4:Request "get "/crazy/1"""-Ok'
  end
  # Update info about genius id=2
  it 'update genius', type: :request do
		header = { 'Content-Type' => 'application/json' }
		put 'crazy/2', { 'name': 'Rick Sunchez', 'try_kill': 30, 'crazy': 70 }.to_json, header
		expect(last_response.status).to eq(200)
		puts 'Step-5:Genius updated'
  end
  # Update invention
	it 'update invent', type: :request do
		header = { 'Content-Type' => 'application/json' }
		put '/invent/2', { 'name_arm': 'Telescop', 'power': 60, 'key_id': 3 }.to_json, header
		expect(last_response.status).to eq(200)
		puts 'Step-6:Invention update'
  end
  # Delete Genius with Invention.
  it 'delete genius' do
		delete '/crazy/1'
		expect(last_response.status).to eq(302)
		puts 'Step-7: deleted' end
end
