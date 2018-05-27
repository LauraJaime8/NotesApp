class FriendRequestsController < ApplicationController

  def create
    @friend_request = current_user.friend_requests.build(:friend_id => params[:friend_id])
    if @friend_request.save
      flash[:success] = "Request send."
      redirect_to root_url
    else
      flash[:error] = "Unable to request friend."
      redirect_to root_url
    end
  end

  def destroy
    @friend_request = FriendRequest.all.where(:friend_id => params[:friend_id], :user_id => params[:user_id])
    @friend_request.destroy_all
    flash[:notice] = "Removed request."
    redirect_to root_url
  end
end
