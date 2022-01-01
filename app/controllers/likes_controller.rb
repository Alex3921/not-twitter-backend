class LikesController < ApplicationController

  def index
    liked_posts_serialized = current_user.liked_posts.map{|p| PostSerializer.new(p)}
    render json: { liked_posts: liked_posts_serialized }, status: :accepted
  end

  def create
    liked_post = current_user.liked.build(like_params)
    liked_post.save
    render json: { message: "Post was added to favorites!" }, status: :created
  end

  private
  def like_params
    params.require(:likes).permit(:post_id)
  end
  
end
