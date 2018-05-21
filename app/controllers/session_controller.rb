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
        session[:user_id] = @user.id
        session[:user_cover] = @user.cover_filename
        session[:user_email] = @user.email
        session[:user_profile] = @user
        redirect_to root_url
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
