class FriendRequestsController < ApplicationController

  def create
    @friend_request = current_user.friend_requests.build(:friend_id => params[:friend_id])
    if @friend_request.save
      flash[:notice] = "Request send."
      redirect_to root_url
    else
      flash[:error] = "Unable to request friend."
      redirect_to root_url
    end
  end

  def destroy
    @friend_request = current_user.friend_requests.find(params[:id])
    @friend_request.destroy
    flash[:notice] = "Removed friendship."
    redirect_to root_url
  end
end
