class UsersController < ApplicationController

  def index
    user = User.all
    render json: user
  end

  def show
    user = User.find(params[:user_id])
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :bio, :birthdate, :location, :name)
  end
end
