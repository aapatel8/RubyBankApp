class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts, id: false do |t|
      t.primary_key :AccountNumber

      t.timestamps
      t.string :BankName
      t.float :Balance

      t.belongs_to :user
    end
  end
end
