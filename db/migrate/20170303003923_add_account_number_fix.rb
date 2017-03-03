class AddAccountNumberFix < ActiveRecord::Migration[5.0]
  def change
    change_table :accounts do |t|
      t.rename "account_number", :AccountNumber
    end
  end
end
