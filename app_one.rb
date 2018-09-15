require 'rubygems'
require 'sinatra'
require 'json'
require 'sequel'
require_relative 'models/genius'
configure { set :server, :puma }


get '/' do
  Genius.all.to_json
end

get '/crazy/:id/invents' do
  @genius = Genius.first(id: params[:id]).invents
  @genius ? @genius.to_json : { 'message' => 'Записей не найдено' }.to_json
end

get '/crazy/:id/invents/:key' do
  @genius = Genius.first(id: params[:id]).invents_dataset.first(id: params[:key])
  @genius ? @genius.to_json : { 'message' => 'Запиись не найдена' }.to_json
end


get '/crazy/:id' do
  @genius = Genius.first(id: params[:id])
  @genius ? @genius.to_json : { 'message' => 'Запись не найдена' }.to_json
end

post '/add' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  success_one = Genius.create(name: data['name'], crazy: data['crazy'], try_kill: data['try_kill'],
                              created: DateTime.now)
  succes_two = Invent.create(name_arm: data['name_arm'], power: data['power'], added: DateTime.now,
                             genius_id: data['key_id'])


  if success_one && succes_two
    redirect '/'
  else
    json crazy.errors.full_message
  end
end


post '/crazy/:id/add' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  Genius.first(id: params[:id]).add_invent(name_arm: data['name_arm'], power: data['power'], added: DateTime.now,
                                           genius_id: data['key_id'])
end

put '/crazy/:id' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  crazy = Genius.first(id: params[:id])
  crazy.update(name: data['name'], crazy: data['crazy'], try_kill: data['try_kill'], created: DateTime.now)
end

put '/crazy/:id/add' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  Genius.first(id: params[:id]).update_invent(name_arm: data['name_arm'], power: data['power'], added: DateTime.now, genius_id: data['key_id'])
end

put '/invent/:id' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  invent = Invent.first(id: params[:id])
  invent.update(name_arm: data['name_arm'], power: data['power'], added: DateTime.now, genius_id: data['key_id'])
end

delete '/crazy/:id' do      # Delete Genius & Invent
  crazy = Genius.first(id: params[:id])
  if crazy.destroy
    redirect '/'
  else
    json crazy.errors.full_message
  end
end


delete '/crazy/:id/:key' do      # Delete Genius & Invent
  crazy = Genius.first(id: params[:id]).invents_dataset.first(id: params[:key])
  if crazy.destroy
    redirect '/'
  else
    json crazy.errors.full_message
  end
end

