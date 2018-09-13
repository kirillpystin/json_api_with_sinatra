Sequel.migration do
  change do
    create_table :geniuses do # crazy geniuses
      primary_key :id
      String :name, unique: true
      Integer :try_kill, null: false # attempts to destroy the galaxy
      Integer :crazy, null: false # crazy index
      DateTime :created, null: false # Data and Time creating
    end
  end
end
