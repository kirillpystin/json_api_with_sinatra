require_relative './spec_helper'
require_relative '../app_one'
require 'json'

describe 'Test app' do
	include Rack::Test::Methods

  it 'Add Genius(id:1)', type: :request do
		header = {'Content-Type' => 'application/json'}
		post '/add', { 'name': 'Morty Sunchez', 'try_kill': 10, 'crazy': 90, 'name_arm': 'Turbo car', 'power': 60, 'key_id': 2 }.to_json,header
		expect(last_response.status).to eq(302)
    puts 'Step-1: Crazy genius saved'
  end

  it 'Add Genius(id: 2)', type: :request do
		header = {'Content-Type' => 'application/json'}
		post '/add', { 'name': 'Dr.Evil', 'try_kill': 30, 'crazy':70,'name_arm': 'Space Bomb', 'power': 80, 'key_id':3 }.to_json, header
		expect(last_response.status).to eq(302)
    puts 'Step-2: Crazy genius saved'
  end

	it 'Add Invent for Genius(id: 2)', type: :request do
		header = {'Content-Type' => 'application/json'}
		post '/crazy/2/add', { 'name_arm': 'Teleportator', 'power': 60 }.to_json, header
		expect(last_response.status).to eq(200)
		puts 'Step-4: Teleportator from Genius(id:2) saved'
  end

	it 'Add Invent for Genius(id: 2)', type: :request do
		header = {'Content-Type' => 'application/json'}
		post '/crazy/2/add', { 'name_arm': 'Robots-Solgers', 'power': 60 }.to_json, header
		expect(last_response.status).to eq(200)
		puts 'Step-4: Teleportator from Genius(id:2) saved'
	end

  it 'All Geniuses' do
			get '/'
			expect(last_response).to be_ok
			puts 'Step-5: Request "get "/"""-Ok'
  end

  it 'see information on the invention of the Genius(id:1)' do
    get '/crazy/1'
    expect(last_response.status).to eq(200)
    puts 'Step-6: Request "get "/crazy/1"""-Ok'
  end

  it 'update Genius(id: 2)', type: :request do
		header = { 'Content-Type' => 'application/json' }
		put 'crazy/2', { 'name': 'Rick Sunchez', 'try_kill': 30, 'crazy': 70 }.to_json, header
		expect(last_response.status).to eq(200)
		puts 'Step-7: Genius updated'
  end
  # Update invention
	it 'update Invent(id: 2)', type: :request do
		header = { 'Content-Type' => 'application/json' }
		put '/invent/2', { 'name_arm': 'Telescop', 'power': 60, 'key_id': 3 }.to_json, header
		expect(last_response.status).to eq(200)
		puts 'Step-8: Invention(id:2) updated'
  end
  # Delete Genius with Invention.
  it 'delete Genius(id:1) with all his Inventions' do
		delete '/crazy/1'
		expect(last_response.status).to eq(302)
		puts 'Step-8: Genius(id:1) and Invention was deleted'
  end

	it 'Delete Invent(id:5) from Genius(id: 2)' do
		delete '/crazy/2/5'
		expect(last_response.status).to eq(302)
		puts 'Step-8: Genius(id:1) and Invention was deleted'
	end




end
