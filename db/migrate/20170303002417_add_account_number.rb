class AddAccountNumber < ActiveRecord::Migration[5.0]
  def change
    change_table :accounts do |t|
      t.string "account_number"
      end
  end
end
