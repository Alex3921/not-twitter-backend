class LikesController < ApplicationController

  def index
    liked_posts_serialized = current_user.liked_posts.map{|p| PostSerializer.new(p)}
    render json: { liked_posts: liked_posts_serialized }, status: :accepted
  end

  
end
