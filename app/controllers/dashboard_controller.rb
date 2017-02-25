class DashboardController < ApplicationController
    before_action :authenticate_user!

    def show 
        # Checking authentication
        if !user_signed_in?
            redirect_to :controller => 'devise', :action => 'sessions#new'
        end

        # Storing references to the user for later.  Need to refactor
        @current_user = current_user
        @uid = @current_user.id

        # Chosing an account
        @selectedAccount = @current_user.accounts.find_by_id(params[:id])


        # If no account was selected, we need to try to select one!
        if @selectedAccount == nil
            @selectedAccount = @current_user.accounts.first
        end

        # We need to store the selected account's transactiosn for display!
        if @selectedAccount != nil
            @transactions = @selectedAccount.transactions
        end

        # If transactiosn aren't there, assing a zero element array so the view doesn't die
        if @transactions == nil
            @transactions = []
        end


        # Set up a new transaction with the selected account's ID in case we want to add a new transaction
        @newTransaction = Transaction.new

        if @selectedAccount != nil
            @newTransaction.account_id = @selectedAccount.id
        end

       end
end
