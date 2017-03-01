class AddApprovalFieldToAccounts < ActiveRecord::Migration[5.0]
  def change
      change_table :accounts do |t|
          t.boolean :Approved
          t.rename :BankName, :AccountName
      end
  end
end
