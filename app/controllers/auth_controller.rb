class AuthController < ApplicationController
  skip_before_action :authorized?, only: [:create]

  def create
    @user = User.find_by(username: user_signin_params[:username])

    if @user && @user.authenticate(user_signin_params[:password])
      token = encode_token({ user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: "Invalid username or password" }, status: :unauthorized
    end
  end

  private
  def user_signin_params
    params.require(:user).permit(:username, :password)
  end
end
