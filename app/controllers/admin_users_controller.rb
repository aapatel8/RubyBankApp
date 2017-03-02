class AdminUsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
      @user = User.find( params[:id] )
  end

  def show
      @user = User.find( params[:id] )
  end

  def update
      @user = User.find( user_params )

      @user.save
  end

  def destroy
    @user = User.find( user_params )
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
