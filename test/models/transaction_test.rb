require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "ApproveTransaction should mark transactions \"approved\"" do
    xact = Transaction.new

    xact = Transaction.ApproveTransaction(xact)

    assert xact.status.to_s == "Approved"
  end

  test "DeclineTransaction should mark transactions \"Declined\"" do
      xact = Transaction.new

      xact = Transaction.RejectTransaction(xact)

      assert xact.status == "Rejected"
  end

  test "Pending transactions should not retreive approved transactions" do
      xact = Transaction.new
      xact.status = "Pending"
      xact.save
      xact = Transaction.new
      xact.status = "Pending"
      xact.save
      xact = Transaction.new
      xact = Transaction.ApproveTransaction(xact)
      xact.save

      xacts = Transaction.GetPending

      assert xacts.length == 2
  end

  test "GetPendingAdminApproval should only retrieve transactions that are pending and have an amount greater than 1k" do
      xact = Transaction.new
      xact.status = "Pending"
      xact.amount = 1000
      xact.save
      xact = Transaction.new
      xact.status = "Pending"
      xact.amount = 999
      xact.save
      xact = Transaction.new
      xact.amount = 1000
      xact = Transaction.ApproveTransaction(xact)
      xact.save

      xacts = Transaction.GetPendingAdminApproval

      assert xacts.length == 1
  end
end
