class Transaction < ApplicationRecord
  belongs_to :source_account, :class_name => 'Account', optional: true
  belongs_to :dest_account, :class_name => 'Account', optional: true

    def self.GetPending
        Transaction.where(status: "Pending")
    end

    def self.ApproveTransaction(transaction)
        transaction.status = "Approved"
    end

    def self.RejectTransaction(transaction)
        transaction.status = "Rejected"
    end
end
