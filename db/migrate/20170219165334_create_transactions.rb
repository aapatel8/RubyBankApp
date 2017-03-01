class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :source_account
      t.references :dest_account
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
