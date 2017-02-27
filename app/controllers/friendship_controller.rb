class FriendshipController < ApplicationController
  #  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /friends
  # GET /friends.json
  def index
    @current_user = current_user
    @friendships = current_user.friendships

    @potentialFriends = User.all()
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    logger.debug('In the create method afterall')
    logger.debug( friend_params )
    current_user.friendships.create!(:friend_id => params[:friend_id]) 

    redirect_to friendship_index_path
  end

  def destroy
      @friendship = current_user.friendships.find( params[:id] )
      
      @friendship.destroy

      redirect_to friendship_index_path
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_friend
    @friend = Friend.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def friend_params
    params.permit(:friend_id)
  end
end
