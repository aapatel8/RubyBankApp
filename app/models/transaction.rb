class Transaction < ApplicationRecord
  belongs_to :source_account, :class_name => 'Account', optional: true
  belongs_to :dest_account, :class_name => 'Account', optional: true

    def self.GetPending
        Transaction.where(status: "pending")
    end

    def self.ApproveTransaction(transaction)
        transaction.status = "approved"
    end

    def self.RejectTransaction(transaction)
        transaction.status = "rejected"
    end
end
