class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy,
                                  :following, :followers]

  def index
    @users = User.all
    @users = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    session[:user] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def createAdmin
    @user.admin = true
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully made admin.' }
      format.json { head :no_content }
    end
 end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :cover, :password_confirmation, :email)
    end
end
