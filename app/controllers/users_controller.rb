class UsersController < ApplicationController
# before_action :authorize, only: :index
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path
  end
end

def show
  @user = User.find(params[:id])
  @photos = current_user.photos.all
end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
