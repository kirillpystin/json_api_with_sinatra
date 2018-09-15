require 'sinatra'
require 'date'
require 'sequel'
require 'sqlite3'
require 'time'

# Connect witt database
Sequel.connect('sqlite://geniuses.db')
Sequel::Model.plugin :json_serializer
Sequel.extension :migration


class Genius < Sequel::Model(:geniuses)
  one_to_many :invents
  plugin :validation_helpers
  Genius.plugin :association_dependencies
  Genius.add_association_dependencies invents: :destroy

  def validate
    super
    validates_presence [:name, :crazy, :try_kill]
    errors.add(:name, "can't be empty") if name.empty?
    errors.add(:try_kill, "can't be < 0") if try_kill <= 0
    errors.add(:crazy, "can't be < 0") if crazy <= 0
  end
end



class Invent < Sequel::Model(:invents)
  many_to_one :genius
  plugin :validation_helpers

  def validate
    super
    validates_presence [:name_arm, :power]
    errors.add(:name_arm, "can't be empty") if name_arm.empty?
    errors.add(:power, "can't be < 0") if power <= 0
  end
end


