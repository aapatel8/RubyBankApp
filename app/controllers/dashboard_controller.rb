class DashboardController < ApplicationController
    before_action :authenticate_user!

    def show 
        if !user_signed_in?
            redirect_to :controller => 'devise', :action => 'sessions#new'
        end

        @current_user = current_user
        @uid = @current_user.id

        @selectedAccount = @current_user.accounts.find_by_id(params[:format])


        if @selectedAccount == nil
            @selectedAccount = @current_user.accounts.first
        end

        @transactions = @selectedAccount.transactions

        if @transactions == nil
            @transactions = []
        end


        @newTransaction = Transaction.new

        @newTransaction.account_id = @selectedAccount.id
    end
end
