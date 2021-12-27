class LikesController < ApplicationController

  def index
    user = User.find(params[:user_id])
    likes = user.liked_posts
    render json: likes
  end

  
end
