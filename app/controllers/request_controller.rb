class RequestController < ApplicationController

  def index
    @to = params[:to]
    @to_u = User.find(@to)
    @from = params[:from]
    @amount = params[:amount]

    @trans = Transaction.new
    @trans.to = @to
    @trans.from = @from
    @trans.amount = @amount
    @trans.status = :approved

    @trans.save!

    @to_acct = Account.find_by_user_id(@to)
    @to_acct.balance=(@to.acct.balance-@amount)
    @to_acct.save!


    @from_acct = Account.find_by_user_id(@from)
    @from_acct.balance=(@from_acct.balance+@amount)
    @from_acct.save!

  end
end