class AddAccountStatus < ActiveRecord::Migration[5.0]
  change_table :accounts do |t|
    t.string "status"
  end
end
