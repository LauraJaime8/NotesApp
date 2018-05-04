class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Error occurred when adding friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to root_url
  end

  private
    def friendship_params
      params.require(:friendship).permit(:friend_id, :user_id).permit(:type)
    end
end
