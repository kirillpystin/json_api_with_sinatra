require 'rubygems'
require 'sinatra'
require 'json'
require 'sequel'
require_relative 'models/genius'
configure { set :server, :puma }
# Genius All
get '/' do
  Genius.all.to_json
end
# create Genius and Invention
post '/add' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  success_one = Genius.create(name: data['name'], crazy: data['crazy'],
                              try_kill: data['try_kill'], created: DateTime.now)
  succes_two = Invent.create(name_arm: data['name_arm'], power: data['power'],
                             added: DateTime.now, genius_id: data['key_id'])
  if success_one && succes_two
    status 201
    redirect '/'
  else
    status 500
    json crazy.errors.full_message
  end
end
# Genius
get '/crazy/:id' do
  content_type 'json'
  Genius.first(id: params[:id]).invents.to_json
end
# Update Genius
put '/crazy/:id' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  crazy = Genius.first(id: params[:id])
  crazy.update(name: data['name'], crazy: data['crazy'], try_kill:
      data['try_kill'], created: DateTime.now)
end
# Update Invention
put '/invent/:id' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  invent = Invent.first(id: params[:id])
  invent.update(name_arm: data['name_arm'], power: data['power'],
                added: DateTime.now, genius_id: data['key_id'])
end
# Delete Genius and invent
delete '/crazy/:id' do
  crazy = Genius.first(id: params[:id])
  if crazy.destroy
    status 200
    puts 'Объект удален'
    redirect '/'
  else
    status 500
    json crazy.errors.full_message
  end
end
