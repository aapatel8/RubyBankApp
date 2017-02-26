class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    @current_user = current_user

    if (@transaction.source_account_id == @transaction.dest_account_id)
      raise ArgumentError.new('Source and destination accounts cannot be the same')
    end

    if (!@current_user.accounts.ids.include?(@transaction.source_account_id) && !@current_user.accounts.ids.include?(@transaction.dest_account_id))
      raise ArgumentError.new('Source or destination account must be owned by you')
    end

    @transaction.status = "Pending"
    if (@transaction.amount < 1000)
      @transaction.status = "Completed"
    end

    if ((@transaction.source_account_id != nil) && (@transaction.dest_account_id != nil))
      @request_from_friend = false
      @current_user.friends.each do |friend|
        friend.accounts.each do |account|
          if (account.id == @transaction.source_account_id)
            @has_friend_account = true
            @transaction.status = "Requested"
          end
        end
      end
    end

    respond_to do |format|
      if @transaction.save
        if (@transaction.source_account_id != nil && @transaction.status != "Requested")
          @source_account = Account.find_by_id(@transaction.source_account_id)
          @new_source_balance = @source_account.Balance - @transaction.amount
          @source_account.update_attributes(:Balance => @new_source_balance)
        end
        if (@transaction.dest_account_id != nil && @transaction.status != "Requested")
          @dest_account = Account.find_by_id(@transaction.dest_account_id)
          @new_dest_balance = @dest_account.Balance + @transaction.amount
          @dest_account.update_attributes(:Balance => @new_dest_balance)
        end
        format.html { redirect_to :back, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
          format.html { redirect_to :back, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def request_accept
    @source_account_id = Transaction.find_by_id(params[:id]).source_account_id
    @amount = Transaction.find_by_id(params[:id]).amount
    @source_account = Account.find_by_id(@source_account_id)
    @new_source_balance = @source_account.Balance - @amount
    @source_account.update_attributes(:Balance => @new_source_balance)
    Transaction.find_by_source_account_id(@source_account_id).update_attributes(:status => "Completed")

    @dest_account_id = Transaction.find_by_id(params[:id]).dest_account_id
    @amount = Transaction.find_by_id(params[:id]).amount
    @dest_account = Account.find_by_id(@dest_account_id)
    @new_dest_balance = @dest_account.Balance + @amount
    @dest_account.update_attributes(:Balance => @new_dest_balance)
    Transaction.find_by_dest_account_id(@dest_account_id).update_attributes(:status => "Completed")
  end

  def request_decline
    @source_account_id = Transaction.find_by_id(params[:id]).source_account_id
    @dest_account_id = Transaction.find_by_id(params[:id]).dest_account_id
    Transaction.find_by_source_account_id(@source_account_id).update_attributes(:status => "Completed")
    Transaction.find_by_dest_account_id(@dest_account_id).update_attributes(:status => "Completed")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:source_account_id, :dest_account_id, :amount)
    end
end
