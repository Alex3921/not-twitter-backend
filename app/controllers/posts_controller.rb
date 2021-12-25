class PostsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    followed_users_posts = user.followed_users_posts
    render json: followed_users_posts
  end

end
