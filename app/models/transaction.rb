class Transaction < ApplicationRecord
  belongs_to :source_account, :class_name => 'Account', optional: true
  belongs_to :dest_account, :class_name => 'Account', optional: true

    def self.GetPending
        Transaction.where(status: "Pending")
    end

    def self.GetPendingAdminApproval
        Transaction.where(["status = ? AND amount >= ?", 
                           "Pending",
                           1000.to_s
        ])
    end

    def self.ApproveTransaction(transaction)
        transaction.status = "Approved"

        return transaction
    end

    def self.RejectTransaction(transaction)
        transaction.status = "Rejected"

        return transaction
    end
end
