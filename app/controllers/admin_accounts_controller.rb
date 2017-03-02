class AdminAccountsController < ApplicationController
  before_action :authenticate_admin!  

  def index
      @accounts = Account.all()

  end

  def show
      @account = Account.find(params[:id])
      @user = User.find(@account.user_id)
  end

  def edit
      @account = Account.find(params[:id])
  end

  def update
      @account = Account.find( params[:id] )
      @account.update_attributes( account_params )

      redirect_to admin_account_path(@account)
  end

  def destroy 
      @account = Account.find(params[:id])

      @account.delete

      redirect_to admin_accounts_path
  end

  def approve
      @account = Account.find( params[:id] )

      @account.Approved = true

      @account.save!

      redirect_to :back
  end

  def deny
      @account = Account.find( params[:id] )

      @account.Approved = false

      @account.save!

      redirect_to :back
  end

  private
  def account_params
    params.require(:account).permit(:AccountName, :Balance, :status)
  end
end
