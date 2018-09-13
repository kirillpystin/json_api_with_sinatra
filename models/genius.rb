require 'sinatra'
require 'date'
require 'sequel'
require 'sqlite3'
require 'time'
# connect witt database
Sequel.connect('sqlite://geniuses.db')
Sequel::Model.plugin :json_serializer
Sequel.extension :migration
# Models
class Genius < Sequel::Model(:geniuses)
  one_to_many :invents
  Genius.plugin :association_dependencies
  Genius.add_association_dependencies invents: :destroy
end
class Invent < Sequel::Model(:invents)
  many_to_one :genius
end
# Create  object
if Genius.where(:id => 1).empty?
  Genius.create(name: 'Professor Farnsworth', try_kill: 40, crazy: 50, created: Time.now)
  Invent.create(name_arm: 'Time machine', power: 40, added: Time.now, genius_id: 1)
else
  # at least 1 record for this truck
end

