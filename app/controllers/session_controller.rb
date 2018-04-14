class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by name: params[:username]
      if !@user
        flash.now.alert = "Username #{params[:username]} not sign up"
      render :new
      elsif @user.password == params[:password]
        session[:user] = @user.name
        redirect_to root_url, :notice => "Logged in!"
      else
        flash.now.alert = "password was invalid"
        render :new
      end
  end

  def destroy
    session[:user] = nil
    redirect_to :root
  end
end
