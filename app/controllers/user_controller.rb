class UserController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to :back
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to :back
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def noted
    @users = User.all
  end

  def users
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:lat, :lon, :access_token, :name, :image_url, :email, :headline, :industry, :company, :title)
  end

end
