Sequel.migration do
  change do
    create_table :geniuses do
      primary_key :id
      String :name, unique: true
      Integer :try_kill, null: false
      Integer :crazy, null: false
      DateTime :created, null: false
    end
  end
end
