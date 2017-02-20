class UserWithName < ActiveRecord::Migration[5.0]
  change_table :users do |t|
    t.string "name"
  end
end
