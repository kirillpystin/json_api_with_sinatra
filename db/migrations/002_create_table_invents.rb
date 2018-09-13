Sequel.migration do
  change do
    create_table? :invents do # inventions
      primary_key :id
      String :name_arm, unique: true # name invention
      Integer :power, null: false # destructive force
      DateTime :added, null: true
      foreign_key :genius_id, :geniuses
    end
  end
end
