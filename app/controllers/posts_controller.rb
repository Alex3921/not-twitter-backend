class PostsController < ApplicationController

  def index
    followed_users_posts = current_user.followed_users_posts
    render json: followed_users_posts
  end

  def show

  end

  def create
    byebug
  end

end
