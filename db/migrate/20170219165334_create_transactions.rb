class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
